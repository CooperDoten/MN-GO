import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import mapStoreToProps from '../../redux/mapStoreToProps';
import DeleteIcon from '@material-ui/icons/Delete';
import ChevronRightIcon from '@material-ui/icons/ChevronRight';
import { TextField } from '@material-ui/core';
import './TripData.css'
import Card from '@material-ui/core/Card';
import swal from 'sweetalert';

class TemplateClass extends Component {
  state = {
    comment: '',
  };
  //Fetch this users trips
  componentDidMount() {
    this.props.dispatch({
        type: 'FETCH_USER_TRIPS'
    })
}
//change comment 
  handleChange = (event) => {
    this.setState({
        ...this.state,
        comment: event.target.value
    })
  }
  //send comment to users trip
  onAddComment = () => {
      
      let objectToSend = {
          comment: this.state.comment,
          tripId: this.props.trip.id
      }
      this.props.dispatch({
          type: 'UPDATE_COMMENT',
          payload: objectToSend
      })
      //refresh comment on DOM
      this.props.dispatch({
        type: 'FETCH_USER_TRIPS'
    })
    //clear out input
    this.setState({
      ...this.state,
      comment: ''
    })
  }
  //verify user Delete of trip
  verifyDelete = () => {
    swal({
      title: "Are you sure?",
      text: "Once deleted, you will not be able to undo",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((deleteTrip) => {
      if (deleteTrip) {
        swal("Your trip has been deleted", {
          icon: "success",
        });
        let objectToDelete = {
          tripId: this.props.trip.id
      }
      this.props.dispatch({
          type: 'DELETE_TRIP',
          payload: objectToDelete
      })
      } else {
        swal("Your trip has not been deleted");
      }
    });
  }

  render() {
      console.log('here is our trips id', this.props.trip.id)
    return (
      <div>
        <Card className="myTrips">
          <h1>{this.props.trip.state_park_name}</h1>
          <div className="myImagesDiv">
            <img src={this.props.trip.photo} className="myTripsPhoto" alt="Minnesota State Park"/>
          </div>
          <div className="myTripsDetails"> 
            <div className="myTripsData">
              <div className="campsitePara">
                <p >Campsite: {this.props.trip.camp_site}</p>
            </div>
            <TextField label="Comments" 
                      variant="outlined" 
                      className="comments"
                      multiline
                      rows={4}
                      value={this.state.comment} 
                      onChange={this.handleChange}/>
              <div className="btnDiv" onClick={this.onAddComment} id="commentBtn">
                <Link to="/MyTrips" className="btn btn-2">
                    <span className="txt-left">Comment</span>
                    <span className="round-right"><i><ChevronRightIcon/></i></span>
                </Link>
              </div>
              <div className="commentsDiv">
                <p>{this.props.trip.comments}</p>
              </div>
            </div>
            <div className="deleteIconDiv">
              <DeleteIcon  className="deleteIcon" onClick={this.verifyDelete}/>
            </div> 
          </div>
        </Card>
      </div>
    );
  }
}

export default connect(mapStoreToProps)(TemplateClass);
