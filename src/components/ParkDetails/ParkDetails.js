import React, { Component } from 'react';
import { connect } from 'react-redux';
import {Link} from 'react-router-dom';
import mapStoreToProps from '../../redux/mapStoreToProps';
import './ParkDetails.css';
import {Button, ThemeProvider} from '@material-ui/core';

class ParkDetails extends Component {


  render() {
    return (
        <ThemeProvider>
            <div className="centeredDiv">
                <h1 className="padding20">{this.props.store.park.name}</h1>
                    <img className="max-width70" src={this.props.store.park.photo} />
                    <p className="max-width70">{this.props.store.park.description}</p>
                    <button  className="btn"
                       ><Link to="/ReservationForm">GO!</Link></button>
                    <button className="btn"><Link to="/user">Cancel</Link></button>
            </div>
      </ThemeProvider>
    );
  }
}

export default connect(mapStoreToProps)(ParkDetails);
