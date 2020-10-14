import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';

class ParkDetails extends Component {


  render() {
    return (
      <div>
          <h1>{this.props.store.park.name}</h1>
            <img src={this.props.store.park.photo} />
            <p>{this.props.store.park.description}</p>
        
      </div>
    );
  }
}

export default connect(mapStoreToProps)(ParkDetails);
