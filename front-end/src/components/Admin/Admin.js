import React from 'react';

const Admin = () => {
    return (
        <div className="admin">
            <div className="row">
                <div>
                   <p>Trang quản lý</p>  <i class="fas fa-tasks"></i>
                </div>
                <div>
                <i class="fas fa-users"></i>  Quản lý người dùng 
                </div>
                <div>
                <i class="fas fa-home"></i> Quản lý các phòng
                </div>
            </div>
        </div>
    );
}

export default Admin;
