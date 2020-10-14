import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';
import './StateParksList.css';

class StateParksList extends Component {
  state = {
    heading: 'Class Component',
  };

  render() {
    return (
      <div className="park-photoDiv">
         <img className="park-photo" src={this.props.park.photo}/>
      </div>
    );
  }
}

export default connect(mapStoreToProps)(StateParksList);