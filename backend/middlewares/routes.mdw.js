
module.exports = function (app) {
    app.use('/user', require('../routes/user/user.route'));
    app.use('/host',require('../routes/user/host.route'));
    app.use('/room', require('../routes/room/room.route'));
    app.use('/admin', require('../routes/admin/admin.route'));
};