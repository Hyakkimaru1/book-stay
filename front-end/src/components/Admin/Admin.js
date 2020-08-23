import React from "react";
import { useHistory } from "react-router-dom";

const Admin = () => {
  const history = useHistory();
  return (
    <div className="admin">
      <div className="row">
        <div>
          <p>Trang quản lý</p>
          <i class="fas fa-tasks"></i>
        </div>
        <div
          onClick={() => {
            history.push("/admin/manageusers");
          }}
        >
          <i class="fas fa-users"></i> Quản lý người dùng
        </div>
        <div
          onClick={() => {
            history.push("/host/managerooms");
          }}
        >
          <i class="fas fa-home"></i> Quản lý các phòng
        </div>
      </div>
    </div>
  );
};

export default Admin;
