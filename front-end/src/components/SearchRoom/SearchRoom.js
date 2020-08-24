import React, { useState, useEffect } from "react";
import FilterBar from "./FilterBar";
import Item from "./SearchItem";
import $ from "jquery";
import queryString from "query-string";
import Pagination from "@material-ui/lab/Pagination";
import { ReactComponent as Empty } from "../../icons/empty.svg";

const config = require("../../config/default.json");
export default function SearchRoom(props) {
  const [rooms, setrooms] = useState(null);
  const [page, setPage] = useState(1);
  const [totalPage, settotalPage] = useState({ page: 0, item: 0 });
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
    setsort("0");
  }, [props.value.key]);

  useEffect(() => {
    // console.log("page", page);
    const paramString = queryString.stringify(
      { key: props.value.key, page: page },
    );
    fetchData(paramString);
  }, [filters]);

  useEffect(() => {
    setFilters({ key: props.value.key, ...filters });
    sortF();
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
    comparison = bandA < bandB ? 1 : -1;
    return comparison;
  }
  function compareArea(a, b) {
    const bandA = parseInt(a.dienTich);
    const bandB = parseInt(b.dienTich);
    let comparison = 0;
    comparison = bandA < bandB ? 1 : -1;
    return comparison;
  }

  function sortF() {
    // console.log("sort", rooms);

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
      success: ([val, page, item]) => {
        // console.log("item", item);
        setrooms(val);
        //console.log("VAL", val);
        settotalPage({ page, item });
        sortF();
      },
    });
  };

  return (
    <div className="searchroom">
      <FilterBar sortChange={sortChange} sort={sort}></FilterBar>
      <div className="searchroom__title">
        <p>
          {totalPage.item} homestay có tên hoặc địa điểm trùng với ' {props
            .value
            .key} '
        </p>
      </div>
      <div className="searchroom__content ">
        {(!rooms || rooms.length === 0)
          ? <div className="searchroom_empty">
            <Empty />
          </div>
          : <div>
            <div className="row">
              {rooms && rooms.map((val, i) => <Item key={i} data={val} />)}
            </div>
            <div className="searchroom__content--pagination">
              <Pagination
                count={totalPage.page}
                page={page}
                onChange={handleChange}
                variant="outlined"
                color="secondary"
              />
            </div>
          </div>}
      </div>
    </div>
  );
}
