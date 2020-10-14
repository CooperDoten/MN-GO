import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';

// Basic class component structure for React with default state
// value setup. When making a new component be sure to replace
// the component name TemplateClass with the name for the new
// component.
class ReservationForm extends Component {
state = {
    firstName: '',
    lastName: '',
    streetAddress: '',
    city: '',
    zipCode: '',



}

  render() {
    return (
      <div>
        <h2>Made it into ReservationForm</h2>
        <form>
            <label>First Name: </label>
            <input value={this.state.firstName} onChange={(event) => this.handleChange(event, 'firstName')}/>
            <label>Last Name: </label>
            <input value={this.state.lastName} onChange={(event) => this.handleChange(event, 'lastName')}/>
            <label>Street Address: </label>
            <input value={this.state.streetAddress} onChange={(event) => this.handleChange(event, 'streetAddress')}/>
            <label>City: </label>
            <input value={this.state.city} onChange={(event) => this.handleChange(event, 'city')}/>
            <label>Zip Code: </label>
            <input value={this.state.zipCode} onChange={(event) => this.handleChange(event, 'zipCode')}/>
            <label>Select a Campsite: </label>
            <select>
                <option>A</option>
                <option>B</option>
                <option>A</option>
                <option>A</option>
                <option>A</option>
                <option>A</option>
                <option>A</option>
                <option>A</option>
                <option>A</option>
                <option>A</option>
                

            </select>
        </form>
      </div>
    );
  }
}

export default connect(mapStoreToProps)(ReservationForm);