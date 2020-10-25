import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';
import Card from '@material-ui/core/Card';
import './LandingPage.css';
// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

class LandingPage extends Component {
  state = {
    heading: 'Class Component',
  };
  //scroll to top on page load
  componentDidMount() {
    window.scrollTo(0, 0)
  }
  //on click push to login page
  onLogin = (event) => {
    this.props.history.push('/login');
  };

  render() {
    return (
      <div className="container">
        <h2>{this.state.heading}</h2>
        <div className="grid">
          <div className="grid-col grid-col_6">
            <Card className="landingPageCard">
              <p className="landingPagePara">
                From 10,000 lakes to the rolling bluffs. From
                the sight of first snow, to a long summer's day spent at the lake,
                there's something for everyone. Come and stay for a while and see why Minnesota
                is America's best kept secret.
              </p>
              <img src='/images/boundaryWatersImage.png' alt='Boundary Waters canoer'
                    className="boundaryWatersImage"/>
            </Card>
          </div>
          <div className="grid-col grid-col_6" id="registerFormPage">
            <RegisterForm />
            <center className="alreadyAMember">
              <span>Already a Member? </span>
              <button className="btn btn_asLink" onClick={this.onLogin}>
                Login
              </button>
            </center>
          </div>
        </div>
      </div>
    );
  }
}

export default connect(mapStoreToProps)(LandingPage);
