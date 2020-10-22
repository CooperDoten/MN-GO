import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';
import './ImagesCarosel.css';
// Basic class component structure for React with default state
// value setup. When making a new component be sure to replace
// the component name TemplateClass with the name for the new
// component.
class ImagesCarosel extends Component {
  state = {
    heading: 'Class Component',
  };
  //image carosel to add specific images to state park in park details
  render() {
      console.log('we made it into our images prop', this.props.image);
    return (
      <div className="individualStateParkDiv">
        <img className="individualStateParkImage" src={this.props.image.photo} alt="Minnesota State Park"/>
      </div>
    );
  }
}

export default connect(mapStoreToProps)(ImagesCarosel);