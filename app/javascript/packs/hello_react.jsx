// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import Test from '../components/Test'
import $ from 'jquery/dist/jquery';

class Hello extends React.Component {

    constructor(props) {
        super(props);
        this.text = ['ноль', 'один','два','три','четыре','пять','шесть', 'семь', 'восемь', 'девять','десять'];
        this.state = {
            costs: []
        };
    }

    componentDidMount() {
        try {
            let rad = document.querySelector('script[data]').getAttribute('data');
            this.setState({costs: rad});
        } catch (e) {
            console.log(e);
        }
    }

    updateCost(cost) {
        this.setState({costs: cost });
    }

    handleChange = () => {
        let cost = this.refs.cost.value;
        console.log('tic' + cost);
        $.ajax({
                url: `/index`,
                type: 'POST',
                data: {cost: cost},
                success: function(data){
                    alert(data);
                    this.updateCost(data);
                }
            }
        )
    }


    render(){

    return (
        <div>
        <input ref='cost' placeholder="Введите сумму" onChange={this.handleChange}/>
            <h2>Вы ввели {this.state.costs} <br/></h2>
        </div>
    );
    }
}

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <Hello />,
        document.body.appendChild(document.createElement('root'))
    );
})

