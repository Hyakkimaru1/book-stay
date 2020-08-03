const db = require('../../utils/db');

module.exports = {
  all: () => db.load('select * from nguoidung'),
  single: async id =>{
    const rows = await db.load(`select * from nguoidung where id = ${id}`);
    if (rows.length === 0)
      return null;
    return rows[0];
  } ,
  singleUsername: async username =>{
    const rows = await db.load(`select * from nguoidung where email = "${username}"`);
    if (rows.length === 0)
      return null; 
    return rows[0];
  } ,
  updateUser: (entity, condition) => db.patch('nguoidung',entity,{id: condition}),
  getUserByEmail: async email =>{
    const rows = await db.load(`select * from nguoidung where email = '${email}'`);
    if (rows.length === 0)
      return null;
    return rows[0];
  },
  addRecoveryKey: entity =>db.add('recoverykey',entity),
  removeRecoveryKey: condition => db.del('recoverykey',condition),
  getRecoveryKey: (id,key) => db.load(`select * from recoverykey where user = '${id}' and keyRecovery = ${key}`),
};