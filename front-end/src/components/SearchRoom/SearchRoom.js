import React, { useState, useEffect } from "react";
import FilterBar from "./FilterBar";
import Item from "./SearchItem";
import $ from "jquery";
import queryString from "query-string";
import Pagination from "@material-ui/lab/Pagination";

const config = require("../../config/default.json");
export default function SearchRoom(props) {
  const [rooms, setrooms] = useState(null);
  const [page, setPage] = useState(1);
  const [totalPage, settotalPage] = useState(1);
  const [filters, setFilters] = useState({ key: "", page: 1 });
  const [sort, setsort] = useState("0");
  const handleChange = (event, value) => {
    setPage(value);
    setFilters({ key: props.value.key, page: value });
  };
  const sortChange = (params) => {
    setsort(params);
    //console.log("params", typeof (sort));
  };
  useEffect(() => {
    setFilters({ key: props.value.key, ...filters });
  }, [props.value.key]);
  useEffect(() => {
    console.log("page", page);

    const paramString = queryString.stringify(
      { key: props.value.key, page: page },
    );
    console.log("param", filters);
    console.log("props", props);
    fetchData(paramString);
    console.log("data", rooms);
  }, [filters]);

  useEffect(() => {
    sortF();
    console.log("object", rooms);
    let i = 0;
    console.log("object nw", rooms);
  }, [sort]);

  function comparePriceUp(a, b) {
    const bandA = a.giaNgayThuong;
    const bandB = b.giaNgayThuong;
    let comparison = 0;
    comparison = bandA > bandB ? 1 : -1;
    return comparison;
  }
  function comparePriceDown(a, b) {
    const bandA = a.giaNgayThuong;
    const bandB = b.giaNgayThuong;
    let comparison = 0;
    comparison = bandA < bandB ? 1 : -1;
    return comparison;
  }

  function compareRoom(a, b) {
    const bandA = parseInt(a.soPhong);
    const bandB = parseInt(b.soPhong);
    let comparison = 0;
    comparison = bandA > bandB ? 1 : -1;
    return comparison;
  }
  function compareArea(a, b) {
    const bandA = parseInt(a.dienTich);
    const bandB = parseInt(b.dienTich);
    let comparison = 0;
    comparison = bandA > bandB ? 1 : -1;
    return comparison;
  }

  function sortF() {
    console.log("sort", sort);

    switch (sort) {
      case "1":
        const t = rooms.sort(comparePriceUp);
        setrooms(t);
        break;
      case "2":
        setrooms(rooms.sort(comparePriceDown));
        break;
      case "3":
        setrooms(rooms.sort(compareRoom));
        break;
      case "4":
        setrooms(rooms.sort(compareArea));
        break;
      default:
        break;
    }
  }

  const fetchData = (param) => {
    $.ajax({
      url: `${config.url}/user/search?` + param,
      type: "get",
      xhrFields: {
        withCredentials: false,
      },
      success: ([val, page]) => {
        setrooms(val);
        settotalPage(page);
      },
    });
  };

  return (
    <div className="searchroom">
      <FilterBar sortChange={sortChange}></FilterBar>
      <div className="searchroom__title">
        <p>5 homestay tại Thành Phố Hồ Chí Minh</p>
      </div>
      <div className="searchroom__content ">
        <div className="row">
          {rooms && rooms.map((val, i) => <Item key={i} data={val} />)}
        </div>
        <div className="searchroom__content--pagination">
          <Pagination
            count={totalPage}
            page={page}
            onChange={handleChange}
            variant="outlined"
            color="secondary"
          />
        </div>
      </div>
    </div>
  );
}
