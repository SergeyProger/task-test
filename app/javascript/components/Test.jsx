import React from "react"
import $ from 'jquery/dist/jquery';

class Test extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            costs: this.props.data
        };
    }

    handleChange = () => {
        let cost = this.refs.cost.value;
        $.ajax({
                type: 'GET',
                url: `/`,
                data: {cost: cost},
                success:(answer) => {
                    this.setState({costs: answer})
                }
            }
        )
    }

    render(){

        return (
            <div>
              <input ref='cost' placeholder="Введите сумму" onChange={this.handleChange} style={{width: 50+'%', height: 40+'px'}}/>
              <h1>Сумма = {this.state.costs}</h1>
            </div>
        );
    }
}

export default Test;
