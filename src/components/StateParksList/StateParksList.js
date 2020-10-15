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
      this.props.dispatch({
        type: 'FETCH_IMAGES',
        payload: park
      })
      
  }

  render() {
    return (
      
        <div className="parkCenteredDiv">
          <img className="park-photo" src={this.props.park.photo} alt="Minnesota State Park"/>
          <button className="userBtn" onClick={() => this.parkDetails(this.props.park)}><Link className="descriptionLink" to="/ParkDetails">Explore</Link></button>
        </div>
    );
  }
}

export default connect(mapStoreToProps)(StateParksList);