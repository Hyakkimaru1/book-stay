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
  addUser: entity =>db.add('nguoidung',entity),
  
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
  sendFeedback: entity =>db.add('danhgia',entity),
  updateUser: (entity, condition) => db.patch('nguoidung',entity,{id: condition}),


};

 // 

