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
        this.state = {
            costs: []
        };
    }

    componentDidMount() {
        try {
            let rad = JSON.parse(document.querySelector('script[data]').getAttribute('data'));
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
                url: `/index/`,
                type: 'GET',
                data: {cost: cost},
                success: (cost) => {
                    this.updateCost(cost);
                }
            }
        )
    }
    render(){

    return (<input ref='cost' placeholder={this.state.costs} onChange={this.handleChange}/>);
    }
}

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <Hello />,
        document.body.appendChild(document.createElement('root'))
    );
})

