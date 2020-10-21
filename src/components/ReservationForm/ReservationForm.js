import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import mapStoreToProps from '../../redux/mapStoreToProps';
import './ReservationForm.css';
import ChevronRightIcon from '@material-ui/icons/ChevronRight';
import ChevronLeftIcon from '@material-ui/icons/ChevronLeft';
import Card from '@material-ui/core/Card';
import swal from 'sweetalert';
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
    inputClasses: 'reservationFormInput'
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
    if(this.state.firstName === '' ) {
        swal({
            title: "Please add your first name",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          }) 
          
    }
    else if(this.state.lastName === '') {
        swal({
            title: "Please add your last name to continue",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          }) 
    }
    else if(this.state.lastName === '') {
        swal({
            title: "Please add your last name to continue",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          }) 
    }
    else if(this.state.email === '') {
        swal({
            title: "Please add your email to continue",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          }) 
    }
    else if(this.state.streetAddress === '') {
        swal({
            title: "Please add your address to continue",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          }) 
    }
    else if(this.state.city === '') {
        swal({
            title: "Please add your City to continue",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          }) 
    }
    else if(this.state.zipCode === '') {
        swal({
            title: "Please add your City to continue",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          }) 
    }
    else if(this.state.campSite === 'selected') {
        swal({
            title: "Please add your City to continue",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          }) 
    }
    else if(this.state.startDate > this.state.endDate ) {
        swal({
            title: "Please make sure trip dates are correct",
            icon: "warning",
            buttons: true,
            dangerMode: true,
          }) 
    }
    else{
        // this.createTrip();
        console.log(`shouldn't make it this far`)
    }
   
 
}
createTrip = () => {
    this.props.dispatch({
        type: 'CREATE_TRIP',
        payload: this.state
    })
    swal({
        title: "Trip Created!",
        icon: "success",
      });
      this.props.history.push('/MyTrips')
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
        <Card>
            <div className="formDiv" >
                <h1>Make a Reservation</h1>
                <div className="reservationFormDiv">
                    <label htmlFor="firstName" id="firstName">First Name: </label>
                        <input name="firstName" className='reservationFormInput'
                            value={this.state.firstName} aria-labelledby="firstName"
                            onChange={(event) => this.handleChange(event, 'firstName')}/>
                    </div>
                    <div className="reservationFormDiv">
                    <label htmlFor="lastName" id="lastName" >Last Name: </label>
                        <input name="lastName" className='reservationFormInput'
                            value={this.state.lastName} aria-labelledby="lastName"
                            onChange={(event) => this.handleChange(event, 'lastName')}/>
                    </div>
                    <div className="reservationFormDiv">
                    <label  htmlFor="email" id="email" >Email: </label>
                        <input name="email" className="reservationFormInput"
                            value={this.state.email} aria-labelledby="email"
                            onChange={(event) => this.handleChange(event, 'email')}/>
                    </div>
                    <div className="reservationFormDiv">
                    <label htmlFor="Address" id="address">Street Address: </label>
                        <input name="Address" className="reservationFormInput"
                            value={this.state.streetAddress} aria-labelledby="Address"
                            onChange={(event) => this.handleChange(event, 'streetAddress')}/>
                    </div>
                    <div className="reservationFormDiv">
                    <label>City: </label>
                        <input className="reservationFormInput"
                            value={this.state.city} 
                            onChange={(event) => this.handleChange(event, 'city')}/>
                    </div>
                    <div className="reservationFormDiv">
                    <label htmlFor="state" id="state">State: </label>
                        <select 
                            value={this.state.state} name="state"  aria-labelledby="state"
                            onChange={(event) => this.handleChange(event, 'state')}>
                            <option disabled value="selected"> -- select a state -- </option>
                                {staticState.map((state, i) => {
                                return <option key={i} value={state}>{state}</option>
                                })}
                        </select>
                    </div>
                    <div className="reservationFormDiv">
                        <label htmlFor="zip code" id="zip code">Zip Code: </label>
                            <input className="reservationFormInput"
                                value={this.state.zipCode} name="zip code"  aria-labelledby="zip code"
                                onChange={(event) => this.handleChange(event, 'zipCode')}/>
                    </div>
                    <div className="reservationFormDiv">
                    <label htmlFor="camp site" id="camp site">Select a Campsite: </label>
                        <select name="camp site"  aria-labelledby="camp site"
                        value={this.state.campSite} onChange={(event) => this.handleChange(event, 'campSite')}>
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
                        <label htmlFor="trip-start" id="trip-start">Start date:</label>
                            <input type="date" id="start" name="trip-start" className="datePicker"
                                value={this.state.startDate} aria-labelledby="trip-start"
                                onChange={(event) => this.handleChange(event, 'startDate')}
                                min="2020-10-01" max="2026-12-31" />
                    </div>
                    <div className="reservationFormDiv">
                        <label  htmlFor="trip-end" id="trip-end">End date:</label>
                            <input type="date" id="end" name="trip-end" className="datePicker"
                                value={this.state.endDate} aria-labelledby="trip-end"
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
                        <Link to="/reservationForm" className="btn btn-2">
                            <span className="txt-left">BOOK</span>
                            <span className="round-right"><i><ChevronRightIcon/></i></span>
                        </Link>
                    </div>
            </div>
      </Card>
    );
  }
}

export default connect(mapStoreToProps)(ReservationForm);