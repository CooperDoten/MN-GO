import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';
import DeleteIcon from '@material-ui/icons/Delete';
import { TextField } from '@material-ui/core';
import './TripData.css'
import Card from '@material-ui/core/Card';
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
  deleteTrip = () => {
      let objectToDelete = {
          tripId: this.props.trip.id
      }
      this.props.dispatch({
          type: 'DELETE_TRIP',
          payload: objectToDelete
      })
  }

  render() {
      console.log('here is our trips id', this.props.trip.id)
    return (
      <div>
      <Card className="myTrips">
        <div className="myImagesDiv">
          <img src={this.props.trip.photo} className="myTripsPhoto"/>
        </div>
        <p >Campsite: {this.props.trip.camp_site}</p>
        <TextField label="Comments" variant="outlined" 
            value={this.state.comment} onChange={this.handleChange}/>
        <button className="descriptionBtn"
            onClick={this.onAddComment}>Add Comment</button>
        <p>{this.props.trip.comments}</p>
        <DeleteIcon  onClick={this.deleteTrip}/>
      </Card>
      </div>
    );
  }
}

export default connect(mapStoreToProps)(TemplateClass);
