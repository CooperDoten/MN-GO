import React, { Component } from 'react';
import { connect } from 'react-redux';
import {Link} from 'react-router-dom';
import mapStoreToProps from '../../redux/mapStoreToProps';
import ImagesCarosel from '../ImagesCarosel/ImagesCarosel';
import Carousel from 'react-material-ui-carousel';
import './ParkDetails.css';
import ChevronRightIcon from '@material-ui/icons/ChevronRight';
import ChevronLeftIcon from '@material-ui/icons/ChevronLeft';
import Card from '@material-ui/core/Card';

class ParkDetails extends Component {


  render() {
    return (
        <div className="centeredDiv">
          <Card className="parkDetailsCard">
            <h1 className="padding20">{this.props.store.park.name}</h1>
            <Carousel className="individualStateParkDiv">
              {this.props.store.images.map((image, i) => 
                <ImagesCarosel className="individualStateParkDiv"
                key={i} image= {image}/>
                )}
              </Carousel>
            <p className="descripPara">{this.props.store.park.description}</p>
              <p className="descripPara">Highlights include: {this.props.store.park.activities}</p>
              <div className="btnDiv">
                <Link to="/user" className="btn btn-2">
                  <span className="round"><i><ChevronLeftIcon/></i></span>
                  <span className="txt-left">BACK</span>
                  </Link>
                </div>
                <div className="btnDiv">
                <Link to="/ReservationForm" className="btn btn-2">
                  <span className="txt-left">GO</span>
                  <span className="round-right"><i><ChevronRightIcon/></i></span>
                  </Link>
                </div>
                </Card>
        </div>
    );
  }
}

export default connect(mapStoreToProps)(ParkDetails);
