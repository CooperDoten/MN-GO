import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';
import './ImagesCarosel.css';
// Basic class component structure for React with default state
// value setup. When making a new component be sure to replace
// the component name TemplateClass with the name for the new
// component.
class TemplateClass extends Component {
  state = {
    heading: 'Class Component',
  };

  render() {
      console.log('we made it into our images prop', this.props.image);
    return (
      <div className="individualStateParkDiv">
        <img className="individualStateParkImage" src={this.props.image.photo}/>
      </div>
    );
  }
}

export default connect(mapStoreToProps)(TemplateClass);