import React, { useEffect, useState, useRef, useContext, useMemo } from 'react';
import $ from 'jquery';
import ItemListBookRoom from './ItemListBookRoom';
import { UserContext } from '../../UserContext';
import queryString from 'query-string';
import { useLocation } from 'react-router-dom';
const config = require('../../config/default.json');
const ListBookRoom = (props) => {
    const location = useLocation();
    const [state] = useContext(UserContext);
    const [data, setData] = useState(null);
    const typingTimeoutRef = useRef(null);
    const [filters,setFilters] = useState({
        page: 1,
    });
    const [numPage,setNumPage] = useState([]);
    const [itemActive,setItemActive] = useState(0);
    const [listFilter,setListFilter] = useState(null);
  
    useEffect(() => {
        let arrayListFilters = [{ten:'Tất cả',id:-1}]; 
        $.get(`${config.url}/host/roomowner/${state.user}`,val => {
            if (val){
                val.map(item => arrayListFilters.push(item));
                setListFilter(arrayListFilters);
            }
        });    
    }, []);

    useEffect(() => {
        const paramString = queryString.stringify(filters);
        $.ajax({
            url: `${config.url}/host/reservations?`+paramString,
            type: 'get',
            xhrFields: {
                withCredentials: true
            },
            success: function( [val,page] ) {
                let arrayPage = [];
                for (let index = 1; index <= page; index++) {
                   arrayPage.push(index);
                }
                setNumPage(arrayPage);
                setData(val);
            }
        })
        .fail(function() {
            //history.push('/ERROR');
        });
    }, [filters]);

    useEffect(() => {
        if (location.search!==""){
            const res = location.search.split("=");
            if (!isNaN(res[1])){
                if (listFilter){
                    listFilter.map((val,i)=>{
                        if (val.id==res[1])
                            return setItemActive(i)
                        return;
                    });
                }
                
                setFilters({
                    page:1,
                    filter:res[1]
                });
            }
        }
    }, [listFilter]);

    const handleChange = e => {
        const keyValue = e.target.value;
        if (typingTimeoutRef.current){
            clearTimeout(typingTimeoutRef.current);
        }

        typingTimeoutRef.current = setTimeout(() => {
            setFilters({
                ...filters,
                page:1,
                title_like:keyValue
            })  
        },300);
    }

    const handlePageChange = (number) => {
        setFilters({
            ...filters,
            page:number
        })
    }

    const handleClickChooseFilter = (id,index) => {
        setItemActive(index);
        setFilters({
                ...filters,
                page:1,
                filter:id,
            });
        document.getElementById("list_filter").style.display = ""
    }

    const handleClickFilter = () => {
        if (document.getElementById("list_filter").style.display === ""){
            document.getElementById("list_filter").style.display = 'block';
        }
        else {
            document.getElementById("list_filter").style.display = ""
        }
    }

    return (
        <div style={{backgroundColor: '#F8F8F8'}}>
            <div style={{marginTop:'10rem'}} className="row">
                <div class="navbarsearch__wrapper" style={{margin: '0 auto',width: '40%'}}>
                    <div class="navbarsearch__wrapper--box" style={{position:'relative',transition:'all 1s'}}>
                        <div className="ListBookRoom__filter" id="list_filter">
                            { listFilter && listFilter.map((val,i) => 
                                <div onClick={() => handleClickChooseFilter(val.id,i)} style={i==itemActive?{color:'#f68a39'}:{color:'#222'}} className="ListBookRoom__filter--item">
                                    {val.ten}
                                </div>)
                            }
                        </div>
                        <svg onClick={handleClickFilter} 
                        xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                            width="25" height="25"
                            viewBox="0 0 172 172"
                            style={{fill:'#000000',cursor:'pointer'}}><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style={{mixBlendMode: 'normal'}}><path d="M0,172v-172h172v172z" fill="none"></path><g><path d="M165.55,141.9h-159.1c-1.1825,0 -2.15,-0.9675 -2.15,-2.15v0c0,-1.1825 0.9675,-2.15 2.15,-2.15h159.1c1.1825,0 2.15,0.9675 2.15,2.15v0c0,1.1825 -0.9675,2.15 -2.15,2.15zM6.45,86h159.1c1.1825,0 2.15,0.9675 2.15,2.15v0c0,1.1825 -0.9675,2.15 -2.15,2.15h-159.1c-1.1825,0 -2.15,-0.9675 -2.15,-2.15v0c0,-1.1825 0.9675,-2.15 2.15,-2.15zM165.55,34.4h-159.1c-1.1825,0 -2.15,-0.9675 -2.15,-2.15v0c0,-1.1825 0.9675,-2.15 2.15,-2.15h159.1c1.1825,0 2.15,0.9675 2.15,2.15v0c0,1.1825 -0.9675,2.15 -2.15,2.15z" fill="#e67e22"></path><path d="M75.25,19.35c-7.12447,0 -12.9,5.77553 -12.9,12.9c0,7.12447 5.77553,12.9 12.9,12.9c7.12447,0 12.9,-5.77553 12.9,-12.9c0,-7.12447 -5.77553,-12.9 -12.9,-12.9z" fill="#dff0fe"></path><path d="M75.25,21.5c5.9254,0 10.75,4.8246 10.75,10.75c0,5.9254 -4.8246,10.75 -10.75,10.75c-5.9254,0 -10.75,-4.8246 -10.75,-10.75c0,-5.9254 4.8246,-10.75 10.75,-10.75M75.25,17.2c-8.3119,0 -15.05,6.7381 -15.05,15.05c0,8.3119 6.7381,15.05 15.05,15.05c8.3119,0 15.05,-6.7381 15.05,-15.05c0,-8.3119 -6.7381,-15.05 -15.05,-15.05z" fill="#e67e22"></path><path d="M135.45,75.25c-7.12447,0 -12.9,5.77553 -12.9,12.9c0,7.12447 5.77553,12.9 12.9,12.9c7.12447,0 12.9,-5.77553 12.9,-12.9c0,-7.12447 -5.77553,-12.9 -12.9,-12.9z" fill="#dff0fe"></path><path d="M135.45,77.4c5.9254,0 10.75,4.8246 10.75,10.75c0,5.9254 -4.8246,10.75 -10.75,10.75c-5.9254,0 -10.75,-4.8246 -10.75,-10.75c0,-5.9254 4.8246,-10.75 10.75,-10.75M135.45,73.1c-8.3119,0 -15.05,6.7381 -15.05,15.05c0,8.3119 6.7381,15.05 15.05,15.05c8.3119,0 15.05,-6.7381 15.05,-15.05c0,-8.3119 -6.7381,-15.05 -15.05,-15.05z" fill="#e67e22"></path><g><path d="M49.45,126.85c-7.12447,0 -12.9,5.77553 -12.9,12.9c0,7.12447 5.77553,12.9 12.9,12.9c7.12447,0 12.9,-5.77553 12.9,-12.9c0,-7.12447 -5.77553,-12.9 -12.9,-12.9z" fill="#dff0fe"></path><path d="M49.45,129c5.9254,0 10.75,4.8246 10.75,10.75c0,5.9254 -4.8246,10.75 -10.75,10.75c-5.9254,0 -10.75,-4.8246 -10.75,-10.75c0,-5.9254 4.8246,-10.75 10.75,-10.75M49.45,124.7c-8.3119,0 -15.05,6.7381 -15.05,15.05c0,8.3119 6.7381,15.05 15.05,15.05c8.3119,0 15.05,-6.7381 15.05,-15.05c0,-8.3119 -6.7381,-15.05 -15.05,-15.05z" fill="#e67e22"></path></g></g></g></svg>
                        <div class="navbarsearch__wrapper--box-field"><svg id="Layer_1" enable-background="new 0 0 512.002 512.002" height="15" viewBox="0 0 512.002 512.002" width="15" xmlns="http://www.w3.org/2000/svg"><g><path d="m495.594 416.408-134.086-134.095c14.685-27.49 22.492-58.333 22.492-90.312 0-50.518-19.461-98.217-54.8-134.31-35.283-36.036-82.45-56.505-132.808-57.636-1.46-.033-2.92-.054-4.392-.054-105.869 0-192 86.131-192 192s86.131 192 192 192c1.459 0 2.93-.021 4.377-.054 30.456-.68 59.739-8.444 85.936-22.436l134.085 134.075c10.57 10.584 24.634 16.414 39.601 16.414s29.031-5.83 39.589-16.403c10.584-10.577 16.413-24.639 16.413-39.597s-5.827-29.019-16.407-39.592zm-299.932-64.453c-1.211.027-2.441.046-3.662.046-88.224 0-160-71.776-160-160s71.776-160 160-160c1.229 0 2.449.019 3.671.046 86.2 1.935 156.329 73.69 156.329 159.954 0 86.274-70.133 158.029-156.338 159.954zm277.296 121.02c-4.525 4.531-10.547 7.026-16.958 7.026s-12.434-2.495-16.966-7.034l-129.294-129.284c6.813-5.307 13.319-11.094 19.458-17.365 5.174-5.285 9.998-10.825 14.48-16.58l129.291 129.3c4.535 4.532 7.032 10.556 7.032 16.962s-2.496 12.431-7.043 16.975z"></path><path d="m192 64.001c-70.58 0-128 57.42-128 128s57.42 128 128 128 128-57.42 128-128-57.42-128-128-128zm0 224c-52.935 0-96-43.065-96-96s43.065-96 96-96 96 43.065 96 96-43.065 96-96 96z"></path></g></svg>
                        <input type="text" onChange={handleChange} placeholder="Tìm kiếm" id="search-input" class="booking__input-text bold"/></div>
                    </div>
                </div>
                <div>
                    {
                        data&&data.map(val=><ItemListBookRoom data={val}/>)
                    } 
                </div>
                <div style={{textAlign:'center',marginTop:'2rem'}}>
                    <button class="ListBookRoom__button" disabled={filters.page<=1||numPage.length===0} onClick={_ => handlePageChange(filters.page-1)}> Trước</button>
                    {
                        numPage.map(val => 
                            <button class="ListBookRoom__normalBt" value={val} style={ val=== filters.page ? {backgroundColor:'#f68a39'}:null} onClick={_ => handlePageChange(val)}>{val}</button>
                        )
                    }
                    <button class="ListBookRoom__button" disabled={filters.page>=numPage[numPage.length-1] ||numPage.length===0} onClick={_ => handlePageChange(filters.page+1)}>Sau</button>
                </div>
            </div>
        </div>
        );
}

export default React.memo(ListBookRoom);
