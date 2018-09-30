// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react';
import ReactDOM from 'react-dom';
import Test from '../components/Test'


document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <Test />,
        document.body.appendChild(document.createElement('root'))
    );
})

