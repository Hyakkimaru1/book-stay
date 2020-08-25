const express = require("express");
const userModels = require("../../models/user/user.models");
const adminModels = require("../../models/admin/admin.models");
const roomModels = require("../../models/room/room.models");
const jwt = require("jsonwebtoken");
const multer = require("multer");
const mkdirp = require("mkdirp");
const nodeMailer = require("../../models/user/sendMail.models");
const dayByDay = require("../../public/js/getDayByDay");
const momoModels = require("../../models/momo/momo.models");
const paginate = require("../../config/default.json").paginate;

//private key for token
const privateKey = require("../../config/default.json").secret;
var bcrypt = require("bcryptjs");
var Cookies = require("js-cookie");
const e = require("express");
const router = express.Router();

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    const dir = "./public/imgs/user/" + req.id;
    mkdirp(dir, (err) => cb(err, dir));
  },
  filename: async function (req, file, cb) {
    var newFileName = file.fieldname + "-" + file.originalname;
    req.body.avatar = "http://localhost:3300/imgs/user/" + req.id + "/" +
      newFileName;
    cb(null, newFileName);
  },
});

var upload = multer({ storage: storage }).array("file");

router.post("/profile", verifyToken, async (req, res) => {
  jwt.verify(req.token, privateKey, async (err, authData) => {
    if (err) {
      res.sendStatus(404);
    } else {
      if (!authData.admin) {
        const row = await userModels.single(authData.user.id);
        delete row.pass;
        delete row.id;
        delete row.timeCreate;
        row.avt = row.avatar;
        delete row.avatar;
        res.send(row);
      } else res.sendStatus(404);
    }
  });
});

router.post("/profile/update", verifyToken, async (req, res) => {
  jwt.verify(req.token, privateKey, async (err, authData) => {
    if (err) {
      res.sendStatus(404);
    } else {
      if (req.body.gioitinh === "") {
        req.body.gioitinh = 1;
      }
      const row = await userModels.updateUser(req.body, authData.user.id);
      if (row.insertId !== null && row.insertId !== undefined) {
        res.sendStatus(200);
      } else res.sendStatus(400);
    }
  });
});

router.post("/profile/updateavt", verifyToken, async (req, res) => {
  jwt.verify(req.token, privateKey, async (err, authData) => {
    if (err) {
      res.sendStatus(404);
    } else {
      req.id = authData.user.id;
      upload(req, res, async function (err) {
        if (err instanceof multer.MulterError) {
          return res.status(500).json(err);
        } else if (err) {
          return res.status(500).json(err);
        }
        const row = await userModels.updateUser(
          { avatar: req.body.avatar },
          authData.user.id,
        );
        if (row.insertId !== null && row.insertId !== undefined) {
          res.sendStatus(200);
        } else res.sendStatus(400);
      });
    }
  });
});

router.post("/login", async (req, res) => {
  if (req.body) {
    // check is user or admin
    const rowAdmin = await adminModels.singleUsername(req.body.username);
    if (rowAdmin) {
      const rs = bcrypt.compareSync(req.body.password, rowAdmin.pass);
      if (rs) {
        delete rowAdmin.pass;
        //if admin will send token admin
        //jwt.sign({user:row,admin:true}, privateKey, function(err, token)

        jwt.sign(
          { user: rowAdmin, admin: true },
          privateKey,
          function (err, token) {
            if (err) {
              res.send(500);
            }
            res.send(
              {
                token,
                id: rowAdmin.id,
                ten: rowAdmin.email,
                email: rowAdmin.email,
                avt:
                  "https://cdn.luxstay.com/users_avatar_default/default-avatar.png",
                admin: true,
              },
            );
          },
        );
      } else res.sendStatus(403);
    } else {
      const row = await userModels.singleUsername(req.body.username);

      if (!row) {
        res.sendStatus(404);
      } else {
        const rs = bcrypt.compareSync(req.body.password, row.pass);
        if (rs) {
          delete row.pass;
          delete row.gioitinh;
          delete row.timeCreate;
          //if admin will send token admin
          //jwt.sign({user:row,admin:true}, privateKey, function(err, token)

          jwt.sign({ user: row }, privateKey, function (err, token) {
            if (err) {
              res.send(500);
            }
            res.send(
              {
                token,
                id: row.id,
                diachi: row.diachi,
                ngaysinh: row.ngaysinh,
                gioithieu: row.gioithieu,
                gioitinh: row.gioitinh,
                ten: row.ten,
                email: row.email,
                sdt: row.sdt,
                avt: row.avatar,
                admin: false,
              },
            );
          });
        } else res.sendStatus(403);
      }
    }
  } else res.sendStatus(403);
});

router.post("/signup", async (req, res) => {
  if (req.body) {
    const row = await userModels.singleUsername(req.body.email);

    if (row) {
      res.sendStatus(404);
    } else {
      const entity = req.body;
      entity.pass = bcrypt.hashSync(req.body.pass, 10);
      entity.avatar = "https://cdn.luxstay.com/users_avatar_default/default-avatar.png";

      const add = await userModels.addUser(entity);
      if (add) {
        const row2 = await userModels.singleUsername(req.body.email);
        const data = { id: row2.id };
        jwt.sign({ user: data }, privateKey, function (err, token) {
          res.send({ token,id: data.id,
            diachi: data.diachi,
            ngaysinh: data.ngaysinh,
            gioithieu: data.gioithieu,
            gioitinh: data.gioitinh,
            ten: data.ten,
            email: data.email,
            sdt: data.sdt,
            avt: data.avatar,
            admin: false,});
        });
      } else {
        res.sendStatus(403);
      }
    }
  } else res.sendStatus(403);
});

router.post("/forgotpw", async (req, res) => {
  if (req.body) {
    const row = await userModels.singleUsername(req.body.email);

    if (!row) {
      res.sendStatus(404);
    } else {
      const data = nodeMailer.sendOTP(req.body.email);

      res.send({ otp: data.otp });
    }
  } else res.sendStatus(403);
});

router.post("/resetpw", async (req, res) => {
  if (req.body) {
    const entity = req.body;
    entity.pass = bcrypt.hashSync(req.body.pass, 10);
    const row = await userModels.patchByEmail(entity);

    if (!row) {
      res.sendStatus(404);
    } else {
      res.send({ id: 1 });
    }
  } else res.sendStatus(403);
});

router.post("/loginAgain", verifyToken, async (req, res) => {
  jwt.verify(req.token, privateKey, async (err, authData) => {
    if (err) {
      res.sendStatus(404);
    } else {
      if (authData.admin) {
        res.send(
          {
            id: authData.user.id,
            ten: authData.user.email,
            sdt: "",
            avt:
              "https://cdn.luxstay.com/users_avatar_default/default-avatar.png",
            admin: true,
          },
        );
      } else {
        const row = await userModels.single(authData.user.id);
        res.send(
          {
            id: row.id,
            diachi: row.diachi,
            ngaysinh: row.ngaysinh,
            gioithieu: row.gioithieu,
            gioitinh: row.gioitinh,
            ten: row.ten,
            email: row.email,
            sdt: row.sdt,
            avt: row.avatar,
            admin: false,
          }
        );
      }
    }
  });
});

router.post("/forgotpassword", async (req, res) => {
  const row = await userModels.getUserByEmail(req.body.email);
  if (row) {
    const currentDate = new Date();
    const countDownTime = new Date(currentDate.getTime() + 5 * 60000);
    const randomnumber = Math.floor(Math.random() * (999999 - 100000 + 1)) +
      100000;

    const [result, resultSendMail] = await Promise.all(
      [
        userModels.addRecoveryKey({ user: row.id, keyRecovery: randomnumber }),
        nodeMailer.sendKeyToEmail(row.email, randomnumber),
      ],
    );
    if (resultSendMail) {
      const x = setTimeout(async () => {
        await userModels.removeRecoveryKey({ id: result.insertId });
      }, 4 * 60000);
    }
    res.send({ time: countDownTime, id: row.id });
  } else res.sendStatus(404);
});

router.post("/loginAgain", verifyToken, async (req, res) => {
  jwt.verify(req.token, privateKey, async (err, authData) => {
    if (err) {
      res.send(500);
    } else {
      if (authData.admin) {
        const rowAdmin = await adminModels.single(authData.user.id);
        res.send(
          {
            id: authData.user.id,
            ten: rowAdmin.email,
            email: rowAdmin.email,
            avt:
              "https://cdn.luxstay.com/users_avatar_default/default-avatar.png",
            admin: true,
          },
        );
      } else {
        const row = await userModels.single(authData.user.id);
        res.send(
          {
            id: row.id,
            diachi: row.diachi,
            ngaysinh: row.ngaysinh,
            gioithieu: row.gioithieu,
            gioitinh: row.gioitinh,
            ten: row.ten,
            email: row.email,
            sdt: row.sdt,
            avt: row.avatar,
            admin: false,
          },
        );
      }
    }
  });
});

router.post("/forgotpassword", async (req, res) => {
  const row = await userModels.getUserByEmail(req.body.email);
  if (row) {
    const currentDate = new Date();
    const countDownTime = new Date(currentDate.getTime() + 5 * 60000);
    const randomnumber = Math.floor(Math.random() * (999999 - 100000 + 1)) +
      100000;

    const [result, resultSendMail] = await Promise.all(
      [
        userModels.addRecoveryKey({
          user: row.id,
          keyRecovery: randomnumber,
        }),
        nodeMailer.sendKeyToEmail(row.email, randomnumber),
      ],
    );
    if (resultSendMail) {
      const x = setTimeout(async () => {
        await userModels.removeRecoveryKey({
          id: result.insertId,
        });
      }, 4 * 60000);
    }
    res.send({
      time: countDownTime,
      id: row.id,
    });
  } else res.sendStatus(404);
});

router.post("/confirmkey", async (req, res) => {
  if (isNaN(req.body.key)) {
    res.sendStatus(400);
  } else {
    const row = await userModels.getRecoveryKey(req.body.id, req.body.key);
    if (row.length > 0) {
      userModels.removeRecoveryKey({
        user: req.body.id,
      });
      jwt.sign(
        {
          id: req.body.id,
        },
        privateKey,
        {
          expiresIn: "1h",
        },
        function (
          err,
          token,
        ) {
          if (err) {
            res.send(500);
          } else {
            res.send({
              token,
            });
          }
        },
      );
    } else res.sendStatus(404);
  }
});

router.post("/changepassword", async (req, res) => {
  jwt.verify(req.body.token, privateKey, async (err, authData) => {
    if (err) {
      res.sendStatus(404);
    } else {
      const hash = bcrypt.hashSync(req.body.password);
      const row = await userModels.updateUser({ pass: hash }, authData.id);
      if (row.affectedRows > 0) {
        res.sendStatus(200);
      } else {
        res.sendStatus(503);
      }
    }
  });
});

router.post("/changepassword2", async (req, res) => {
  jwt.verify(req.body.token, privateKey, async (err, authData) => {
    if (err) {
      res.sendStatus(404);
    } else {
      const checkuser = await userModels.single(authData.user.id);
      if (checkuser) {
        const rs = bcrypt.compareSync(req.body.currentpassword, checkuser.pass);
        if (rs) {
          const hash = bcrypt.hashSync(req.body.password);
          const row = await userModels.updateUser({
            pass: hash,
          }, authData.user.id);
          if (row.affectedRows > 0) {
            res.sendStatus(200);
          } else {
            res.sendStatus(503);
          }
        } else {
          res.sendStatus(400);
        }
      } else res.sendStatus(400);
    }
  });
});

//verify the token
function verifyToken(req, res, next) {
  //Get token in cookies
  if (req.cookies) {
    req.token = req.cookies.token;
    next();
  } else {
    res.sendStatus(403);
  }
}

router.get("/mybooking/:id", verifyToken, async (req, res) => {
  jwt.verify(req.token, privateKey, async (err, authData) => {
    if (err) {
      res.sendStatus(404);
      console.log(err);
    } else {
      let row;
      if (!req.query.trangthai || req.query.trangthai === "") {
        if (req.query.ngaycheckout && req.query.ngaycheckin) {
          row = await userModels.allBookingRange(
            req.params.id,
            req.query.ngaycheckin,
            req.query.ngaycheckout,
          );
        } else if (req.query.ngaycheckin || req.query.ngaycheckout) {
          row = await userModels.allBookingRange(
            req.params.id,
            req.query.ngaycheckin
              ? req.query.ngaycheckin
              : req.query.ngaycheckout,
            req.query.ngaycheckin
              ? req.query.ngaycheckin
              : req.query.ngaycheckout,
          );
        } else {
          row = await userModels.allBooking(req.params.id);
        }
      } else {
        if (req.query.ngaycheckout && req.query.ngaycheckin) {
          if (req.query.hoantat) {
            row = await userModels.allBookingTrangThaiValidRange(
              req.params.id,
              req.query.trangthai,
              req.query.ngaycheckin,
              req.query.ngaycheckout,
            );
          } else {
            row = await userModels.allBookingTrangThaiRange(
              req.params.id,
              req.query.trangthai,
              req.query.ngaycheckin,
              req.query.ngaycheckout,
            );
          }
        } else if (req.query.ngaycheckin || req.query.ngaycheckout) {
          if (req.query.ngaycheckin) {
            if (req.query.hoantat) {
              row = await userModels.allBookingTrangThaiValidRange(
                req.params.id,
                req.query.trangthai,
                req.query.ngaycheckin,
                req.query.ngaycheckin,
              );
            } else {
              row = await userModels.allBookingTrangThaiRange(
                req.params.id,
                req.query.trangthai,
                req.query.ngaycheckin,
                req.query.ngaycheckin,
              );
            }
          } else {
            if (req.query.hoantat) {
              row = await userModels.allBookingTrangThaiValid(
                req.params.id,
                req.query.trangthai,
                req.query.ngaycheckout,
                req.query.ngaycheckout,
              );
            } else {
              row = await userModels.allBookingTrangThai(
                req.params.id,
                req.query.trangthai,
                req.query.ngaycheckout,
                req.query.ngaycheckout,
              );
            }
          }
        } else {
          if (req.query.hoantat) {
            row = await userModels.allBookingTrangThaiValid(
              req.params.id,
              req.query.trangthai,
            );
          } else {
            row = await userModels.allBookingTrangThai(
              req.params.id,
              req.query.trangthai,
            );
          }
        }
      }
      if (row.length > 0) {
        for (let index = 0; index < row.length; index++) {
          const img = await roomModels.getImgRoom(row[index].phong);
          row[index].img = img;
          const comment = await userModels.checkComment(row[index].id);
          if (comment.length > 0) {
            row[index].danhgia = 0;
          } else {
            row[index].danhgia = 1;
          }
        }
      }
      if (row) {
        res.send(row);
      } else res.sendStatus(400);
    }
  });
});

router.post("/changepassword2", async (req, res) => {
  jwt.verify(req.body.token, privateKey, async (err, authData) => {
    if (err) {
      res.sendStatus(404);
    } else {
      if (!authData.admin) {
        const checkuser = await userModels.single(authData.user.id);
        if (checkuser) {
          const rs = bcrypt.compareSync(
            req.body.currentpassword,
            checkuser.pass,
          );
          if (rs) {
            const hash = bcrypt.hashSync(req.body.password);
            const row = await userModels.updateUser({
              pass: hash,
            }, authData.user.id);
            if (row.affectedRows > 0) {
              res.sendStatus(200);
            } else {
              res.sendStatus(503);
            }
          } else {
            res.sendStatus(400);
          }
        } else res.sendStatus(400);
      } else {
        const checkuser = await adminModels.single(authData.user.id);
        if (checkuser) {
          const rs = bcrypt.compareSync(
            req.body.currentpassword,
            checkuser.pass,
          );
          if (rs) {
            const hash = bcrypt.hashSync(req.body.password);
            const row = await adminModels.updateAdmin({
              pass: hash,
            }, authData.user.id);
            if (row.affectedRows > 0) {
              res.sendStatus(200);
            } else {
              res.sendStatus(503);
            }
          } else {
            res.sendStatus(400);
          }
        } else res.sendStatus(400);
      }
    }
  });
});
router.post("/mybooking/feedback", verifyToken, async (req, res) => {
  jwt.verify(req.token, privateKey, async (err, authData) => {
    if (err) {
      //console.log(req.body)
      res.sendStatus(404);
      console.log(err);
    } else {
      const row = await userModels.sendFeedback(req.body);
      if (row) {
        res.send("oke");
      } else res.sendStatus(400);
    }
  });
});

router.post("/cancelbooking", verifyToken, (req, res) => {
  jwt.verify(req.token, privateKey, async (err, authData) => {
    if (err) {
      //console.log(req.body)
      res.sendStatus(404);
      console.log(err);
    } else {
      //body need id book
      //
      const row = await userModels.getDetailCancel(req.body.id);
      if (row.length === 0) {
        res.sendStatus(404);
      } else {
        if (row[0].nguoidat == authData.user.id) {
          const arrayDay = dayByDay(row[0].ngaycheckin, row[0].ngaycheckout);
          //adding short term out of room to table hetphong
          let arrayIdOutOfRoom = [];

          arrayDay.map(async (val) => {
            const resultOFR = await roomModels.getOutOffRoom(row[0].phong, val);
            if (resultOFR.length > 0) {
              arrayIdOutOfRoom.push(resultOFR[0]);
            }
          });
          const resultOFD = await roomModels.updateNguoiDatPhong({
            trangthai: -1,
          }, row[0].id);
          if (resultOFD.affectedRows === 0) {
            res.sendStatus(503);
          } else {
            //call momo to refund cast
            // const resultRefund = await momoModels.sendRequestRefund(row[0].id+"rf",row[0].id,row[0].gia,row[0].transId);
            arrayIdOutOfRoom.map(async (val) => {
              await roomModels.updateOutOfRoom(
                { sophongconlai: val.sophongconlai + 1 },
                val.id,
              );
            });
            res.sendStatus(200);
          }
        } else {
          res.sendStatus(403);
        }
      }
    }
  });
});

router.get("/search", async (req, res) => {
  const query = req.query;

  let row, total, nPage;
  let limit = paginate.limit * 3;
  let totalRoom;
  // console.log("limit", limit);
  try {
    [row, total] = await Promise.all(
      [
        userModels.getRoomsSearch(
          query,
          limit,
          15 * (req.query.page - 1),
        ),
        userModels.getNumRoomsSearch(query),
      ],
    );

    if (total) {
      totalRoom = total.length;
    } else {
      totalRoom = 0;
    }

    nPage = Math.floor(
      totalRoom / (limit) + (totalRoom % limit > 0 ? 1 : 0),
    );
  } catch (error) {
    res.sendStatus(404);
    console.log("Error", error);
  }

  res.send([row, nPage, totalRoom]);
});

router.post("/registerhost", verifyToken, async (req, res) => {
  jwt.verify(req.token, privateKey, async (err, authData) => {
    if (err) {
      res.sendStatus(404);
    } else {
      const row = await userModels.regHost(authData.user.id);
      if (row) {
        res.sendStatus(200);
      } else {
        res.sendStatus(304);
      }
    }
  });
});

router.get("/manageusers", verifyToken, async (req, res) => {
  jwt.verify(req.token, privateKey, async (err, authData) => {
    if (err) {
      res.sendStatus(404);
    } else {
      if (!authData.admin) {
        if (req.query.title_like) {
          res.redirect(
            `./admin/manageuser?title_like=${req.query.title_like}`,
          );
        } else {
          res.redirect("../admin");
        }
      } else {
        let row;
        if (req.query.title_like) {
          row = await userModels.getUsersSearch(
            req.query.title_like,
          );
        } else {
          row = await userModels.all();
        }
        res.send(row);
      }
    }
  });
});

router.post("/:id/update", verifyToken, async (req, res) => {
  let row;
  if (isNaN(req.params.id)) {
    res.send("false");
  } else {
    jwt.verify(req.token, privateKey, async (err, authData) => {
      if (err) {
        res.sendStatus(404);
      } else {
        if (authData.admin) {
          const condition = { id: req.params.id };
          let entity;
          if (req.body.trangThai === "true") {
            entity = { isBan: 0 };
          } else {
            entity = { isBan: 1 };
          }
          row = await userModels.updateUser(entity, req.params.id);
          if (row.affectedRows > 0) {
            res.sendStatus(200);
          } else res.sendStatus(500);
        } else {
          res.sendStatus(403);
        }
      }
    });
  }
});

router.post("/:id/upHost", verifyToken, async (req, res) => {
  let row;
  if (isNaN(req.params.id)) {
    res.send("false");
  } else {
    jwt.verify(req.token, privateKey, async (err, authData) => {
      if (err) {
        res.sendStatus(404);
      } else {
        if (authData.admin) {
          const condition = { id: req.params.id };
          let entity = { upHost: req.body.upHost };
          row = await userModels.updateUser(entity, req.params.id);
          if (row.affectedRows > 0) {
            res.sendStatus(200);
          } else res.sendStatus(500);
        } else {
          res.sendStatus(403);
        }
      }
    });
  }
});

module.exports = router;
