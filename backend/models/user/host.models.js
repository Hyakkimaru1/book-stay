const db = require('../../utils/db');

module.exports = {
  all: () => db.load('select * from nguoidung'),
  single: async id =>{
    const rows = await db.load(`select * from nguoidung where id = ${id}`);
    if (rows.length === 0)
      return null;
    return rows[0];
  } ,
  addRoom: entity =>db.add('phong',entity),
  addImgRoom: entity =>db.add('img',entity),
};