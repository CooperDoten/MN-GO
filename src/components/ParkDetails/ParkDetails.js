import React, { Component } from 'react';
import { connect } from 'react-redux';
import {Link} from 'react-router-dom';
import mapStoreToProps from '../../redux/mapStoreToProps';
import './ParkDetails.css';


class ParkDetails extends Component {


  render() {
    return (
        <div className="centeredDiv">
            <h1 className="padding20">{this.props.store.park.name}</h1>
            <img className="max-width70" src={this.props.store.park.photo} />
            <p className="max-width70">{this.props.store.park.description}</p>
            <div className="widthDiv">
                <button className="descriptionBtn"
                    ><Link className="descriptionLink" to="/ReservationForm">GO!</Link></button>
                <button className="descriptionBtn"><Link className="descriptionLink" to="/user">Cancel</Link></button>
            </div>
        </div>
    );
  }
}

export default connect(mapStoreToProps)(ParkDetails);
