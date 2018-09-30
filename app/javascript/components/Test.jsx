import React from "react"
import $ from 'jquery/dist/jquery';

class Test extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            costs: false
        };
    }

    handleChange = () => {
        let cost = this.refs.cost.value;
        console.log('tic ' + cost);
        $.ajax({
                type: 'GET',
                url: `/`,
                data: {cost: cost},
                success:(answer) => {
                    console.log('ответ сервера'+ answer);
                    this.setState({costs: !this.state.costs})
                    console.log('state '+ this.state.costs);
                }
            }
        )
    }


    render(){

        return (
            <div>
              <input ref='cost' placeholder="Введите сумму" onChange={this.handleChange}/>
              <h1>Сумма = {this.props.data}</h1>
            </div>
        );
    }
}

export default Test;
