import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import mapStoreToProps from '../../redux/mapStoreToProps';
import './ReservationForm.css';
import ChevronRightIcon from '@material-ui/icons/ChevronRight';
import ChevronLeftIcon from '@material-ui/icons/ChevronLeft';
// Basic class component structure for React with default state
// value setup. When making a new component be sure to replace
// the component name TemplateClass with the name for the new
// component.
class ReservationForm extends Component {
state = {
    userId: '',
    firstName: '',
    lastName: '',
    email: '',
    streetAddress: '',
    city: '',
    state: '',
    zipCode: '',
    campSite: 'selected',
    stateParkId: '',
    startDate: '',
    endDate: '',
    photo: '',
}
handleChange = (event, propertyName) => {
    this.setState({
        ...this.state,
        [propertyName]: event.target.value,
        stateParkId: this.props.store.park.id,
        userId: this.props.store.user.id,
        photo: this.props.store.park.photo
    })
}
onSubmit = () => {
    console.log('in on submit', this.state)
    this.props.dispatch({
        type: 'CREATE_TRIP',
        payload: this.state
    })
    console.log(this.state);
}
  render() {
    const staticState = [
        'AL', 'AK', 'AZ', 'AR', 'CA', 
        'CO', 'CT', 'DE', 'FL', 'GA',
        'HI', 'ID', 'IL', 'IN', 'IA',
        'KS', 'KY', 'LA', 'ME', 'MD',
        'MA', 'MI', 'MN', 'MS', 'MO',
        'MT', 'NE', 'NV', 'NH', 'NJ',
        'NM', 'NY', 'NC', 'ND', 'OH',
        'OK', 'OR', 'PA', 'RI', 'SC',
        'SD', 'TN', 'TX', 'UT', 'VT',
        'VA', 'WA', 'WV', 'WI', 'WY',
    ];    
    return (
      <div className="formDiv">
          <h1>Make a Reservation</h1>
          <div className="reservationFormDiv">
            <label>First Name: </label>
                <input className="reservationFormInput"
                    value={this.state.firstName} 
                    onChange={(event) => this.handleChange(event, 'firstName')}/>
            </div>
            <div className="reservationFormDiv">
            <label>Last Name: </label>
                <input className="reservationFormInput"
                    value={this.state.lastName} 
                    onChange={(event) => this.handleChange(event, 'lastName')}/>
            </div>
            <div className="reservationFormDiv">
            <label>Email: </label>
                <input className="reservationFormInput"
                    value={this.state.email} 
                    onChange={(event) => this.handleChange(event, 'email')}/>
            </div>
            <div className="reservationFormDiv">
            <label>Street Address: </label>
                <input className="reservationFormInput"
                    value={this.state.streetAddress} 
                    onChange={(event) => this.handleChange(event, 'streetAddress')}/>
            </div>
            <div className="reservationFormDiv">
            <label>City: </label>
                <input className="reservationFormInput"
                    value={this.state.city} 
                    onChange={(event) => this.handleChange(event, 'city')}/>
            </div>
            <div className="reservationFormDiv">
            <label>State: </label>
                <select 
                    value={this.state.state} 
                    onChange={(event) => this.handleChange(event, 'state')}>
                    <option disabled value="selected"> -- select a state -- </option>
                        {staticState.map((state, i) => {
                        return <option key={i} value={state}>{state}</option>
                        })}
                </select>
            </div>
            <div className="reservationFormDiv">
            <label>Zip Code: </label>
                <input className="reservationFormInput"
                    value={this.state.zipCode} 
                    onChange={(event) => this.handleChange(event, 'zipCode')}/>
            </div>
            <div className="reservationFormDiv">
            <label>Select a Campsite: </label>
                <select value={this.state.campSite} onChange={(event) => this.handleChange(event, 'campSite')}>
                    <option disabled value="selected"> -- select a site -- </option>
                    <option>A</option>
                    <option>B</option>
                    <option>C</option>
                    <option>D</option>
                    <option>E</option>
                    <option>F</option>
                    <option>G</option>
                    <option>H</option>
                    <option>I</option>
                    <option>J</option>
                    <option>K</option>
                    <option>L</option>
                    <option>M</option>
                    <option>N</option>
                    <option>O</option>
                    <option>P</option>
                </select>
            </div>
            <div className="reservationFormDiv">
            <label>Start date:</label>
                <input type="date" id="start" name="trip-start" className="datePicker"
                    value={this.state.startDate}
                    onChange={(event) => this.handleChange(event, 'startDate')}
                    min="2020-10-01" max="2026-12-31" />
            </div>
            <div className="reservationFormDiv">
            <label>End date:</label>
                <input type="date" id="end" name="trip-end" className="datePicker"
                    value={this.state.endDate} 
                    onChange={(event) => this.handleChange(event, 'endDate')}
                    min="2020-10-01" max="2026-12-31"/>
                </div>
                <div className="btnDiv">
                <Link to="/user" className="btn btn-2">
                  <span className="round"><i><ChevronLeftIcon/></i></span>
                  <span className="txt-left">BACK</span>
                  </Link>
                </div>
              <div className="btnDiv" onClick={this.onSubmit}>
                <Link to="/MyTrips" className="btn btn-2">
                  <span className="txt-left">BOOK</span>
                  <span className="round-right"><i><ChevronRightIcon/></i></span>
                  </Link>
                </div>
      </div>
    );
  }
}

export default connect(mapStoreToProps)(ReservationForm);