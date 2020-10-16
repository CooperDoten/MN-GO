import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';
import TripData from '../TripData/TripData'
import './MyTrips.css'
// Basic class component structure for React with default state
// value setup. When making a new component be sure to replace
// the component name TemplateClass with the name for the new
// component.
class MyTrips extends Component {
  state = {
    heading: 'MyTrips',
  };
  componentDidMount() {
      this.props.dispatch({
          type: 'FETCH_USER_TRIPS'
      })
  }

  render() {
    return (
      <div>
          {this.props.store.userTrips.map((trip, i) => 
          <TripData  key={i} trip={trip}/>)}
      </div>
    );
  }
}

export default connect(mapStoreToProps)(MyTrips);