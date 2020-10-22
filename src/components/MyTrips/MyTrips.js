import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';
import TripData from '../TripData/TripData'
import './MyTrips.css';
import Carousel from 'react-material-ui-carousel';
// Basic class component structure for React with default state
// value setup. When making a new component be sure to replace
// the component name TemplateClass with the name for the new
// component.
class MyTrips extends Component {
  state = {
    heading: 'MyTrips',
  };
  //Fetch user trips to send to Trip Data component
  componentDidMount() {
      this.props.dispatch({
          type: 'FETCH_USER_TRIPS'
      })
  }

  render() {
    return (
      <div>
        <Carousel autoPlay={false}>
          {this.props.store.userTrips.map((trip, i) => 
          <TripData  key={i} trip={trip}/>)}
        </Carousel>
      </div>
    );
  }
}

export default connect(mapStoreToProps)(MyTrips);