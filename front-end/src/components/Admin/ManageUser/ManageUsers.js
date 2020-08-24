import React, { useEffect, useState, useContext, useRef } from "react";
import { useParams, useHistory } from "react-router-dom";
import ItemUser from "./ItemUser";
import $ from "jquery";
import moment from "moment";
import queryString from "query-string";
import { UserContext } from "../../../UserContext";

const config = require("./../../../config/default.json");

const ManageUsers = () => {
  const { id } = useParams();
  const [state] = useContext(UserContext);
  const history = useHistory();
  const [data, setData] = useState(null);
  const typingTimeoutRef = useRef(null);
  const [filters, setFilters] = useState({});
  useEffect(() => {
    if (state.user === null) {
      history.push("/ERROR");
    }
    const paramString = queryString.stringify(filters);
    $.ajax({
      url: `${config.url}/user/manageusers?` + paramString,
      type: "get",
      xhrFields: {
        withCredentials: true,
      },
      success: (val) => {
        setData(val);
        console.log("Data", val);
      },
    });
  }, [filters]);

  const handleChange = (e) => {
    const keyValue = e.target.value;
    if (typingTimeoutRef.current) {
      clearTimeout(typingTimeoutRef.current);
    }

    typingTimeoutRef.current = setTimeout(() => {
      setFilters({
        ...filters,
        title_like: keyValue,
      });
    }, 300);
  };

  return (
    <div style={{ backgroundColor: "#F8F8F8", marginBottom: "2rem" }}>
      <div style={{ marginTop: "10rem" }} className="row">
        <div className="UserTitle">Quản lý người dùng</div>
        <div className="searchBox__manage">
          <div
            className="searchBox"
            style={{ gridColumnStart: "3", marginRight: "4rem" }}
          >
            <i className="fas fa-search fa-lg searchBox__icon"></i>
            <input
              type="text"
              onChange={handleChange}
              placeholder="Tìm kiếm"
              className="searchBox__manage--text"
            />
          </div>
        </div>
        <div>
          {data && data.map((val, i) => <ItemUser key={i} data={val} />)}
        </div>
      </div>
    </div>
  );
};

export default ManageUsers;
