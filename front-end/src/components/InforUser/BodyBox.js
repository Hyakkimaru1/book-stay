import React, { Component } from 'react';
import ListOptions from './ListOptions';
import Showrooms from './Showrooms';
class BodyBox extends Component {
    constructor(props){
        super(props);
        this.state={
            option: "ListOption1"
        }
        this.setOption = this.setOption.bind(this);
    }

    setOption(newOption){
        this.setState({option:newOption});
    }

    render() {
        const bodyShowroom = this.state.option==="ListOption1"?<Showrooms/>:<div className="Showroom">aaa</div>

        return (
        <div className="row" style={{marginTop:'-4rem'}}>
            <div className="col-1-of-3">
                <ListOptions onClick={this.setOption}/>
            </div>
            <div className="col-2-of-3">
                {bodyShowroom}
            </div>
        </div>
        );
    }
}

export default BodyBox;

