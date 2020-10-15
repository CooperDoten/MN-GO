import React, { Component } from 'react';
import { connect } from 'react-redux';
import LogOutButton from '../LogOutButton/LogOutButton';
import mapStoreToProps from '../../redux/mapStoreToProps';
import StateParksList from '../StateParksList/StateParksList';
import './UserPage.css';
class UserPage extends Component {
  componentDidMount() {
    console.log(`in component did mount`)
    this.props.dispatch({
      type: 'FETCH_PARKS'
    })
  }
  // this component doesn't do much to start, just renders some user info to the DOM
  render() {
    return (
      <div>
        <h1 id="welcome">Welcome to MN GO!</h1>
        
        <div className="centeredDiv">
          {this.props.store.parks.map(park => 
            <StateParksList key={park.id} park={park}/>)}
        </div>
      </div>
    );
  }
}

// this allows us to use <App /> in index.js
export default connect(mapStoreToProps)(UserPage);
