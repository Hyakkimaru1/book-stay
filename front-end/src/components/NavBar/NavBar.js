import React, { useState, useEffect } from "react";
import { RangeDayPickerNav } from "../PageRoom/RangeDayPickerNav";
import GuestPopup from "./GuestPopup";
import {
  BrowserRouter as Router,
  Link,
  useLocation,
  useHistory,
} from "react-router-dom";

function useQuery() {
  return new URLSearchParams(useLocation().search);
}

const NavBar = (props) => {
  const [pickdate, setPickdate] = useState(false);
  const [guestOpen, setGuestOpen] = useState(false);
  const [startDay, setStartDay] = useState(null);
  const [endDate, setEndDate] = useState(null);
  const [sum, setSum] = useState(0);
  const [valueSearch, setvalueSearch] = useState("");
  const [baby, setBaby] = useState(0);
  const history = useHistory();
  const totalChange = (total, baby) => {
    setSum(total);
    setBaby(baby);
  };
  const handleValueSearch = (e) => {
    setvalueSearch(e.target.value);
  };
  //let query = useQuery();

  useEffect(() => {
    const a = document.getElementsByClassName("DateRangePickerInput_arrow_1");
    a[0].style.display = "none";
    const b = document.getElementsByClassName(
      "DateRangePickerInput__withBorder",
    );
    b[0].style.width = "140px";
    const c = document.getElementsByClassName("DateInput");
    c[1].style.display = "none";
    const e = document.getElementsByClassName("DateInput_1");
    e[0].style.textAlign = "start";

    document.getElementById("basicEndDate").style.display = "none";
    document.getElementById("basicStartDate").style.marginBottom = 0;
    document.getElementById("basicStartDate").placeholder = "Ngày";
  }, []);

  useEffect(() => {
    let str = props.value.key;
    const test = str.normalize("NFKD").replace(/[\u0300-\u036f]/g, "");
    // console.log("testTring", test);
    // console.log("keysearch", props);
  }, [props.value]);
  const a = props.value;

  const handleBtnSearchClick = (e) => {
    const item = {
      key: valueSearch,
      startD: startDay,
      endD: endDate,
      guest: sum,
    };
    props.onChange(item);
  };
  const handleSearchClick = (e) => {
    if (e.keyCode == 13) {
      const item = {
        key: valueSearch,
        startD: startDay,
        endD: endDate,
        guest: sum,
      };
      props.onChange(item);

      // console.log("query", query.get("name"));
    }
  };

  return (
    <nav id="navbar" className="navbar">
      <div className="navbar__container ">
        <div className="navbar__container--left ">
          <div className="navbar-logo" style={{cursor:'pointer'}} onClick={()=>history.push('/')}>
            <img
              alt="a"
              src="https://i.pinimg.com/236x/c1/09/73/c10973a2554dcebd540db0bd62066c62--origami-lion-lion-logo.jpg"
            >
            </img>
          </div>
          <div className="navbarsearch">
            <div className="navbarsearch__wrapper">
              <div className="navbarsearch__wrapper--box">
                <div className="navbarsearch__wrapper--box-field">
                  <svg
                    id="Layer_1"
                    enableBackground="new 0 0 512.002 512.002"
                    height="15"
                    viewBox="0 0 512.002 512.002"
                    width="15"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <g>
                      <path
                        d="m495.594 416.408-134.086-134.095c14.685-27.49 22.492-58.333 22.492-90.312 0-50.518-19.461-98.217-54.8-134.31-35.283-36.036-82.45-56.505-132.808-57.636-1.46-.033-2.92-.054-4.392-.054-105.869 0-192 86.131-192 192s86.131 192 192 192c1.459 0 2.93-.021 4.377-.054 30.456-.68 59.739-8.444 85.936-22.436l134.085 134.075c10.57 10.584 24.634 16.414 39.601 16.414s29.031-5.83 39.589-16.403c10.584-10.577 16.413-24.639 16.413-39.597s-5.827-29.019-16.407-39.592zm-299.932-64.453c-1.211.027-2.441.046-3.662.046-88.224 0-160-71.776-160-160s71.776-160 160-160c1.229 0 2.449.019 3.671.046 86.2 1.935 156.329 73.69 156.329 159.954 0 86.274-70.133 158.029-156.338 159.954zm277.296 121.02c-4.525 4.531-10.547 7.026-16.958 7.026s-12.434-2.495-16.966-7.034l-129.294-129.284c6.813-5.307 13.319-11.094 19.458-17.365 5.174-5.285 9.998-10.825 14.48-16.58l129.291 129.3c4.535 4.532 7.032 10.556 7.032 16.962s-2.496 12.431-7.043 16.975z"
                      />
                      <path
                        d="m192 64.001c-70.58 0-128 57.42-128 128s57.42 128 128 128 128-57.42 128-128-57.42-128-128-128zm0 224c-52.935 0-96-43.065-96-96s43.065-96 96-96 96 43.065 96 96-43.065 96-96 96z"
                      />
                    </g>
                  </svg>
                  <input
                    type="text"
                    placeholder="Tìm kiếm"
                    id="search-input"
                    className="booking__input-text bold"
                    value={valueSearch}
                    onChange={handleValueSearch}
                    onKeyDown={(event) => {
                      handleSearchClick(event);
                    }}
                  >
                  </input>
                </div>

                <div
                  className="navbarsearch__wrapper--box-calender"
                  onClick={() => setPickdate(true)}
                >
                  <RangeDayPickerNav
                    onDatesChange={(newStartDay, newEndDate) => {
                      if (newEndDate) {
                        document.getElementById("basicEndDate").style.display =
                          "";
                        const b = document.getElementsByClassName(
                          "DateRangePickerInput__withBorder",
                        );
                        b[0].style.width = "230px";
                        const c = document.getElementsByClassName("DateInput");
                        c[1].style.display = "";
                        const a = document.getElementsByClassName(
                          "DateRangePickerInput_arrow_1",
                        );
                        a[0].style.display = "";
                      }
                      setStartDay(newStartDay);
                      setEndDate(newEndDate);
                    }}
                  />

                  <div
                    className="navbarsearch__wrapper--box-calender not-active "
                  >
                    <svg
                      id="Layer_1"
                      enableBackground="new 0 0 512 512"
                      height="18"
                      viewBox="0 0 512 512"
                      width="18"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <g>
                        <path
                          d="m446 40h-46v-24c0-8.836-7.163-16-16-16s-16 7.164-16 16v24h-224v-24c0-8.836-7.163-16-16-16s-16 7.164-16 16v24h-46c-36.393 0-66 29.607-66 66v340c0 36.393 29.607 66 66 66h380c36.393 0 66-29.607 66-66v-340c0-36.393-29.607-66-66-66zm34 406c0 18.778-15.222 34-34 34h-380c-18.778 0-34-15.222-34-34v-265c0-2.761 2.239-5 5-5h438c2.761 0 5 2.239 5 5z"
                        />
                      </g>
                    </svg>
                    <p>Ngày</p>
                  </div>
                </div>

                <div
                  className="navbarsearch__wrapper--box-guest"
                  onClick={() => setGuestOpen(!guestOpen)}
                >
                  <div className="navbarsearch__wrapper--box-guestwrap">
                    <svg
                      id="bold"
                      enableBackground="new 0 0 24 24"
                      height="20"
                      viewBox="0 0 24 24"
                      width="20"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <circle cx="4" cy="10" r="2" />
                      <path
                        d="m6.67 13.4c-1.01.76-1.67 1.98-1.67 3.35v.25h-4.25c-.41 0-.75-.34-.75-.75v-.5c0-1.52 1.23-2.75 2.75-2.75h2.5c.52 0 1.01.15 1.42.4z"
                      />
                      <circle cx="20" cy="10" r="2" />
                      <path
                        d="m24 15.75v.5c0 .41-.34.75-.75.75h-4.25v-.25c0-1.37-.66-2.59-1.67-3.35.41-.25.9-.4 1.42-.4h2.5c1.52 0 2.75 1.23 2.75 2.75z"
                      />
                      <circle cx="12" cy="9.5" r="3" />
                      <path
                        d="m14.75 14h-5.5c-1.517 0-2.75 1.233-2.75 2.75v1.5c0 .414.336.75.75.75h9.5c.414 0 .75-.336.75-.75v-1.5c0-1.517-1.233-2.75-2.75-2.75z"
                      />
                    </svg>
                    {sum > 0 ? <p>{sum} khách</p> : <p>Số khách</p>}
                    {baby > 0 ? <p>, {baby} trẻ sơ sinh</p> : ""}
                  </div>
                </div>

                <div className="navbarsearch__wrapper--guestpopup">
                  {guestOpen
                    ? <GuestPopup
                      Total={totalChange}
                    />
                    : <p></p>}
                </div>
              </div>

              <div className="navbarsearch__wrapper--button">
                <Link
                  to={`/search?key=${valueSearch}` +
                    (sum != 0 ? `&guest=${sum}` : "")}
                >
                  <button
                    type="button"
                    onClick={handleBtnSearchClick}
                    className="navbarsearch__wrapper--searchbtn"
                  >
                    <svg
                      id="Layer_1"
                      enableBackground="new 0 0 512.002 512.002"
                      height="w0"
                      viewBox="0 0 512.002 512.002"
                      width="w0"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <g>
                        <path
                          d="m495.594 416.408-134.086-134.095c14.685-27.49 22.492-58.333 22.492-90.312 0-50.518-19.461-98.217-54.8-134.31-35.283-36.036-82.45-56.505-132.808-57.636-1.46-.033-2.92-.054-4.392-.054-105.869 0-192 86.131-192 192s86.131 192 192 192c1.459 0 2.93-.021 4.377-.054 30.456-.68 59.739-8.444 85.936-22.436l134.085 134.075c10.57 10.584 24.634 16.414 39.601 16.414s29.031-5.83 39.589-16.403c10.584-10.577 16.413-24.639 16.413-39.597s-5.827-29.019-16.407-39.592zm-299.932-64.453c-1.211.027-2.441.046-3.662.046-88.224 0-160-71.776-160-160s71.776-160 160-160c1.229 0 2.449.019 3.671.046 86.2 1.935 156.329 73.69 156.329 159.954 0 86.274-70.133 158.029-156.338 159.954zm277.296 121.02c-4.525 4.531-10.547 7.026-16.958 7.026s-12.434-2.495-16.966-7.034l-129.294-129.284c6.813-5.307 13.319-11.094 19.458-17.365 5.174-5.285 9.998-10.825 14.48-16.58l129.291 129.3c4.535 4.532 7.032 10.556 7.032 16.962s-2.496 12.431-7.043 16.975z"
                        />
                        <path
                          d="m192 64.001c-70.58 0-128 57.42-128 128s57.42 128 128 128 128-57.42 128-128-57.42-128-128-128zm0 224c-52.935 0-96-43.065-96-96s43.065-96 96-96 96 43.065 96 96-43.065 96-96 96z"
                        />
                      </g>
                    </svg>
                  </button>
                </Link>
              </div>
            </div>
          </div>
        </div>
        <div className="navbar__container--right ">
          <ul className="navbar-nav">{props.children}</ul>
        </div>
      </div>
    </nav>
  );
};

export default NavBar;
