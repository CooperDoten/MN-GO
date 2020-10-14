import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';

class ParkDetails extends Component {
 

  render() {
    return (
      <div>
          <h1>HELLO HELLO HELLO</h1>
        <h2>{this.props.store.park.name}</h2>
      </div>
    );
  }
}

export default connect(mapStoreToProps)(ParkDetails);
