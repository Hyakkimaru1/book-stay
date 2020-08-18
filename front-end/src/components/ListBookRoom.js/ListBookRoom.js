import React, { useEffect, useState, useRef, useContext, useMemo } from 'react';
import $ from 'jquery';
import ItemListBookRoom from './ItemListBookRoom';
import { UserContext } from '../../UserContext';
import queryString from 'query-string';
import { useLocation } from 'react-router-dom';
const config = require('../../config/default.json');
const ListBookRoom = () => {
    const [state] = useContext(UserContext);
    const [data, setData] = useState(null);
    const typingTimeoutRef = useRef(null);
    const [filters,setFilters] = useState({
        page: 1,
    });
    const location = useLocation();
    const [numPage,setNumPage] = useState([]);
    const [itemActive,setItemActive] = useState(0);
    const [listFilter,setListFilter] = useState(null);
    useEffect(() => {
        let arrayListFilters = [{ten:'Tất cả',id:-1}]; 
        $.get(`${config.url}/host/roomowner/${state.user}`,val => {
            val.map(item => arrayListFilters.push(item));
            setListFilter(arrayListFilters);
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
            <div style={{marginTop:'10rem',paddingBottom:'5rem'}} className="row">
                <div class="navbarsearch__wrapper" style={{margin: '0 auto',width: '40%'}}>
                    <div class="navbarsearch__wrapper--box" style={{position:'relative',marginTop:'2rem'}}>
                        <div className="ListBookRoom__filter" id="list_filter">
                            { listFilter && listFilter.map((val,i) => 
                                <div onClick={() => handleClickChooseFilter(val.id,i)} style={i===itemActive?{color:'#f68a39'}:{color:'#222'}} className="ListBookRoom__filter--item">
                                    {val.ten}
                                </div>)
                            }
                        </div>
                        <svg onClick={handleClickFilter} 
                        xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                            width="25" height="25"
                            viewBox="0 0 172 172"
                            style={{fill:'#000000',cursor:'pointer'}}><g fill="none" fillRule="nonzero" stroke="none" strokeWidth="1" strokeLinecap="butt" strokeLinejoin="miter" strokeMiterlimit="10" strokeDasharray="" strokeDashoffset="0" fontFamily="none" fontWeight="none" fontSize="none" textAnchor="none" style={{mixBlendMode: 'normal'}}><path d="M0,172v-172h172v172z" fill="none"></path><g><path d="M165.55,141.9h-159.1c-1.1825,0 -2.15,-0.9675 -2.15,-2.15v0c0,-1.1825 0.9675,-2.15 2.15,-2.15h159.1c1.1825,0 2.15,0.9675 2.15,2.15v0c0,1.1825 -0.9675,2.15 -2.15,2.15zM6.45,86h159.1c1.1825,0 2.15,0.9675 2.15,2.15v0c0,1.1825 -0.9675,2.15 -2.15,2.15h-159.1c-1.1825,0 -2.15,-0.9675 -2.15,-2.15v0c0,-1.1825 0.9675,-2.15 2.15,-2.15zM165.55,34.4h-159.1c-1.1825,0 -2.15,-0.9675 -2.15,-2.15v0c0,-1.1825 0.9675,-2.15 2.15,-2.15h159.1c1.1825,0 2.15,0.9675 2.15,2.15v0c0,1.1825 -0.9675,2.15 -2.15,2.15z" fill="#e67e22"></path><path d="M75.25,19.35c-7.12447,0 -12.9,5.77553 -12.9,12.9c0,7.12447 5.77553,12.9 12.9,12.9c7.12447,0 12.9,-5.77553 12.9,-12.9c0,-7.12447 -5.77553,-12.9 -12.9,-12.9z" fill="#dff0fe"></path><path d="M75.25,21.5c5.9254,0 10.75,4.8246 10.75,10.75c0,5.9254 -4.8246,10.75 -10.75,10.75c-5.9254,0 -10.75,-4.8246 -10.75,-10.75c0,-5.9254 4.8246,-10.75 10.75,-10.75M75.25,17.2c-8.3119,0 -15.05,6.7381 -15.05,15.05c0,8.3119 6.7381,15.05 15.05,15.05c8.3119,0 15.05,-6.7381 15.05,-15.05c0,-8.3119 -6.7381,-15.05 -15.05,-15.05z" fill="#e67e22"></path><path d="M135.45,75.25c-7.12447,0 -12.9,5.77553 -12.9,12.9c0,7.12447 5.77553,12.9 12.9,12.9c7.12447,0 12.9,-5.77553 12.9,-12.9c0,-7.12447 -5.77553,-12.9 -12.9,-12.9z" fill="#dff0fe"></path><path d="M135.45,77.4c5.9254,0 10.75,4.8246 10.75,10.75c0,5.9254 -4.8246,10.75 -10.75,10.75c-5.9254,0 -10.75,-4.8246 -10.75,-10.75c0,-5.9254 4.8246,-10.75 10.75,-10.75M135.45,73.1c-8.3119,0 -15.05,6.7381 -15.05,15.05c0,8.3119 6.7381,15.05 15.05,15.05c8.3119,0 15.05,-6.7381 15.05,-15.05c0,-8.3119 -6.7381,-15.05 -15.05,-15.05z" fill="#e67e22"></path><g><path d="M49.45,126.85c-7.12447,0 -12.9,5.77553 -12.9,12.9c0,7.12447 5.77553,12.9 12.9,12.9c7.12447,0 12.9,-5.77553 12.9,-12.9c0,-7.12447 -5.77553,-12.9 -12.9,-12.9z" fill="#dff0fe"></path><path d="M49.45,129c5.9254,0 10.75,4.8246 10.75,10.75c0,5.9254 -4.8246,10.75 -10.75,10.75c-5.9254,0 -10.75,-4.8246 -10.75,-10.75c0,-5.9254 4.8246,-10.75 10.75,-10.75M49.45,124.7c-8.3119,0 -15.05,6.7381 -15.05,15.05c0,8.3119 6.7381,15.05 15.05,15.05c8.3119,0 15.05,-6.7381 15.05,-15.05c0,-8.3119 -6.7381,-15.05 -15.05,-15.05z" fill="#e67e22"></path></g></g></g></svg>
                       <div className="searchBox">
                            <i class="fas fa-search fa-lg searchBox__icon"></i>
                            <input type="text" onChange={handleChange} placeholder="Tìm kiếm" class="searchBox__text"/>
                       </div>
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