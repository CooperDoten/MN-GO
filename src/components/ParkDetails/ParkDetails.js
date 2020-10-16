import React, { Component } from 'react';
import { connect } from 'react-redux';
import {Link} from 'react-router-dom';
import mapStoreToProps from '../../redux/mapStoreToProps';
import ImagesCarosel from '../ImagesCarosel/ImagesCarosel';
import Carousel from 'react-material-ui-carousel';
import './ParkDetails.css';


class ParkDetails extends Component {


  render() {
    return (
        <div className="centeredDiv">
            <h1 className="padding20">{this.props.store.park.name}</h1>
            <Carousel className="individualStateParkDiv">
              {this.props.store.images.map((image, i) => 
                <ImagesCarosel className="individualStateParkDiv"
                key={i} image= {image}/>
                )}
              </Carousel>
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
