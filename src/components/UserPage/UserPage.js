import React, { Component } from 'react';
import { connect } from 'react-redux';
import LogOutButton from '../LogOutButton/LogOutButton';
import mapStoreToProps from '../../redux/mapStoreToProps';
import StateParksList from '../StateParksList/StateParksList';
import Paper from '@material-ui/core/Paper';
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
        <div className="centeredDiv">
          <Paper elevation={3}>
          <h1 id="welcome">Welcome to MN GO!</h1>
          {this.props.store.parks.map(park => 
            <StateParksList key={park.id} park={park}/>)}
          </Paper>
        </div>

    );
  }
}

// this allows us to use <App /> in index.js
export default connect(mapStoreToProps)(UserPage);
