import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';
import './StateParksList.css';
import {Link} from 'react-router-dom';

class StateParksList extends Component {
  state = {
    heading: 'Class Component',
    park: {}
  };
  parkDetails = (park) => {
    // moreDetails takes what was clicked and binds it to a 
    //movie object dispatches to saga to grab that specific movie 
    //and its genre(s)
      console.log('navigate to ParkDetails', park);
      this.setState({
          park: this.park
      })
      this.props.dispatch({
          type: 'FETCH_PARK',
          payload: park
      });
  }

  render() {
    return (
      <Link to="/ParkDetails">
        <div className="centeredDiv"
          onClick={() => this.parkDetails(this.props.park)}>
          <img className="park-photo" src={this.props.park.photo} alt="Minnesota State Park"/>
        </div>
      </Link>
    );
  }
}

export default connect(mapStoreToProps)(StateParksList);