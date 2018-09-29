import React from "react"

class Test extends React.Component {
  constructor(props){
    super(props)
      this.rad = this.props.data
  }


  render () {
    return (
     <div>
         {this.rad}
     </div>
    );
  }
}

export default Test;
