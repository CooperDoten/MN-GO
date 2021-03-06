import React, { Component } from 'react';
import {
  HashRouter as Router,
  Route,
  Redirect,
  Switch,
} from 'react-router-dom';

import { connect } from 'react-redux';

import Nav from '../Nav/Nav';
import Footer from '../Footer/Footer';

import ProtectedRoute from '../ProtectedRoute/ProtectedRoute';

import UserPage from '../UserPage/UserPage';
import LandingPage from '../LandingPage/LandingPage';
import LoginPage from '../LoginPage/LoginPage';
import RegisterPage from '../RegisterPage/RegisterPage';
import ParkDetails from '../ParkDetails/ParkDetails';
import ReservationForm from '../ReservationForm/ReservationForm';
import MyTrips from '../MyTrips/MyTrips';
import './App.css';
// import { createMuiTheme} from '@material-ui/core';

// //set some primary and secondary color themes
// const theme = createMuiTheme({
//     palette: {
//       primary: {
//         main: '#3F805A'
//       },
//       secondary: {
//           main: '#ffffff'
//       }
//     }
// });


class App extends Component {
  componentDidMount() {
    this.props.dispatch({ type: 'FETCH_USER' });
    
  }
  render() {
    return (
      <Router>
        <div className="appDiv">
          <Nav />
          <Switch>
            {/* Visiting localhost:3000 will redirect to localhost:3000/home */}
            <Redirect exact from="/" to="/home" />

            {/* Visiting localhost:3000/about will show the about page. */}
            <Route
              // shows AboutPage at all times (logged in or not)
              exact
              path="/home"
              component={LandingPage}
            />

            {/* For protected routes, the view could show one of several things on the same route.
            Visiting localhost:3000/user will show the UserPage if the user is logged in.
            If the user is not logged in, the ProtectedRoute will show the LoginPage (component).
            Even though it seems like they are different pages, the user is always on localhost:3000/user */}
            <ProtectedRoute
              // logged in shows UserPage else shows LoginPage
              exact
              path="/user"
              component={UserPage}
            />

            {/* When a value is supplied for the authRedirect prop the user will
            be redirected to the path supplied when logged in, otherwise they will
            be taken to the component and path supplied. */}
            <ProtectedRoute
              // with authRedirect:
              // - if logged in, redirects to "/user"
              // - else shows LoginPage at /login
              exact
              path="/login"
              component={LoginPage}
              authRedirect="/user"
            />
            <ProtectedRoute
              // with authRedirect:
              // - if logged in, redirects to "/ParkDetails"
              // - else shows LoginPage at /login
              exact
              path='/ParkDetails'
              component={ParkDetails}
            />
             <ProtectedRoute
              // with authRedirect:
              // - if logged in, redirects to "/ParkDetails"
              // - else shows LoginPage at /login
              exact
              path='/MyTrips'
              component={MyTrips}
            />
             <ProtectedRoute
              // with authRedirect:
              // - if logged in, redirects to "/ReservationForm"
              // - else shows LoginPage at /login
              exact
              path='/ReservationForm'
              component={ReservationForm}
            />
            <ProtectedRoute
              // with authRedirect:
              // - if logged in, redirects to "/user"
              // - else shows RegisterPage at "/registration"
              exact
              path="/registration"
              component={RegisterPage}
              authRedirect="/user"
            />
            <ProtectedRoute
              // with authRedirect:
              // - if logged in, redirects to "/user"
              // - else shows LandingPage at "/home"
              exact
              path="/home"
              component={LandingPage}
              authRedirect="/user"
            />

            {/* If none of the other routes matched, we will show a 404. */}
            <Route render={() => <h1>Page not found: 404</h1>} />
          </Switch>
          <Footer />
        </div>
      </Router>
    );
  }
}

export default connect()(App);
