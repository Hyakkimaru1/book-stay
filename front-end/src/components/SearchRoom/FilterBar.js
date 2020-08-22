import React, { useState } from "react";
import { ReactComponent as Location } from "../../icons/icons8_location.svg";
import { ReactComponent as Price } from "../../icons/icons8_price.svg";
import { ReactComponent as Type } from "../../icons/icons8_room.svg";
import { ReactComponent as Up } from "../../icons/icons8_up.svg";
import { ReactComponent as Down } from "../../icons/icons8_down_arrow.svg";
import FilterBarItems from "./FilterBarItems";

const FilterBar = (props) => {
  const [filter, setFilter] = useState("0");

  const filterClick = (e) => {
    setFilter(e);
    props.sortChange(e);
  };
  return (
    <div className="filter-bar">
      <hr />
      <FilterBarItems active={filter} onChange={filterClick}>
        <div key="0">
          <span>Tất cả</span>
        </div>
        <div key="1">
          <Price />
          <span>Giá</span>
          <Up />
        </div>
        <div key="2">
          <Price />
          <span>Giá</span>
          <Down />
        </div>
        <div key="3">
          <Type />
          <span>Số phòng</span>
        </div>
        <div key="4">
          <Location />
          <span>Diện tích</span>
        </div>
      </FilterBarItems>
      {/* <div className="filter-bar__content ">
        <div className="item bt__default">
          <Price />
          <span>Giá</span>
          <Up />
        </div>
        <div className="item bt__default">
          <Price />
          <span>Giá</span>
          <Down />
        </div>
        <div className="item bt__default">
          <Type />
          <span>Số phòng</span>
        </div>
        <div className="item bt__default">
          <Location />
          <span>Diện tích</span>
        </div>
      </div>
    </div> */}
    </div>
  );
};

export default FilterBar;
