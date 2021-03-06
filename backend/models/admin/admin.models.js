const db = require('../../utils/db');

module.exports = {
  all: () => db.load('select * from admin'),
  single: async id =>{
    const rows = await db.load(`select * from admin where id = ${id}`);
    if (rows.length === 0)
      return null;
    return rows[0];
  } ,
  singleUsername: async username =>{
    const rows = await db.load(`select * from admin where email = "${username}"`);
    if (rows.length === 0)
      return null; 
    return rows[0];
  } ,
  updateAdmin: (entity, condition) => db.patch('admin', entity, { id: condition }),
  getUserByEmail: async email =>{
    const rows = await db.load(`select * from admin where email = '${email}'`);
    if (rows.length === 0)
      return null;
    return rows[0];
  },
  addRecoveryKey: entity =>db.add('recoverykey',entity),
  removeRecoveryKey: condition => db.del('recoverykey',condition),
  getRecoveryKey: (id,key) => db.load(`select * from recoverykey where user = '${id}' and keyRecovery = ${key}`),addUser: entity =>db.add('nguoidung',entity),
  
  patchByEmail: entity => {
    const condition = { email: entity.email };
    delete entity.email;
    return db.patch('nguoidung', entity, condition);
  },
  allBooking: async id =>{
    const rows = db.load(`SELECT * FROM danhsachdatphong d, phong p
    WHERE d.phong = p.id AND nguoidat = "${id}"`);
    if (rows.length === 0)
    return null;
  return rows;
  },
  getRoomAllManage: id => db.load(`
  SELECT phong.*,img.img 
  FROM phong JOIN img on img.phong = phong.id 
  GROUP BY phong.id`),
  getRoomManageSearch: (title_like) => db.load(`SELECT phong.*,img.img 
  FROM phong JOIN img on img.phong = phong.id 
  WHERE MATCH(phong.ten, phong.diaChi)
  AGAINST ('${title_like}' IN NATURAL LANGUAGE MODE)
  GROUP BY phong.id`),
};
