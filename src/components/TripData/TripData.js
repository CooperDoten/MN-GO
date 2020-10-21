import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';
import DeleteIcon from '@material-ui/icons/Delete';
import { TextField } from '@material-ui/core';
import './TripData.css'
import Card from '@material-ui/core/Card';
import swal from 'sweetalert';
// Basic class component structure for React with default state
// value setup. When making a new component be sure to replace
// the component name TemplateClass with the name for the new
// component.
class TemplateClass extends Component {
  state = {
    comment: '',
  };
  componentDidMount() {
    this.props.dispatch({
        type: 'FETCH_USER_TRIPS'
    })
}
  handleChange = (event) => {
    this.setState({
        ...this.state,
        comment: event.target.value
    })
  }
  onAddComment = () => {
      
      let objectToSend = {
          comment: this.state.comment,
          tripId: this.props.trip.id
      }
      this.props.dispatch({
          type: 'UPDATE_COMMENT',
          payload: objectToSend
      })
      this.props.dispatch({
        type: 'FETCH_USER_TRIPS'
    })
    this.setState({
      ...this.state,
      comment: ''
  })
  }
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
        <div className="myImagesDiv">
          <img src={this.props.trip.photo} className="myTripsPhoto" alt="Minnesota State Park"/>
        </div>
        <p >Campsite: {this.props.trip.camp_site}</p>
        <TextField label="Comments" variant="outlined" 
            value={this.state.comment} onChange={this.handleChange}/>
        <button className="descriptionBtn"
            onClick={this.onAddComment}>Add Comment</button>
        <p>{this.props.trip.comments}</p>
        <DeleteIcon  onClick={this.verifyDelete}/>
      </Card>
      </div>
    );
  }
}

export default connect(mapStoreToProps)(TemplateClass);
