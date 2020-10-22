import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';
import './StateParksList.css';
import {Link} from 'react-router-dom';
import ChevronRightIcon from '@material-ui/icons/ChevronRight';


class StateParksList extends Component {
  state = {
    heading: 'Class Component',
    park: {}
  };
  componentDidMount() {
    window.scrollTo(0, 0);
  }
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
          <h3>{this.props.park.name}</h3>
          <img className="park-photo" src={this.props.park.photo} alt="Minnesota State Park"/>
          {/* <button className="userBtn" ><Link className="descriptionLink" to="/ParkDetails">Explore</Link></button> */}
          <div className="btnDiv" onClick={() => this.parkDetails(this.props.park)}>
                <Link to="/ParkDetails" className="btn btn-2"> 
                  <span className="txt-left">GO</span>
                  <span className="round-right"><i><ChevronRightIcon/></i></span>
                  </Link>
                </div>
        </div>
    );
  }
}

export default connect(mapStoreToProps)(StateParksList);