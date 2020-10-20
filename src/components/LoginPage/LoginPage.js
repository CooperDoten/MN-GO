import React, { Component } from 'react';
import { connect } from 'react-redux';
import mapStoreToProps from '../../redux/mapStoreToProps';
import LoginForm from '../LoginForm/LoginForm';
import Card from '@material-ui/core/Card';
import './LoginPage.css';
class LoginPage extends Component {
  render() {
    return (
      <div>
        <Card  className="loginPage">
        <LoginForm />
        <div className="newToMNGO">
          <span>New to MN-GO?  </span>
          <button
            type="button"
            className="btn btn_asLink"
            onClick={() => {
              this.props.history.push('/registration');
            }}
          >
            Register
          </button>
        </div>
        </Card>
      </div>
    );
  }
}

export default connect(mapStoreToProps)(LoginPage);
