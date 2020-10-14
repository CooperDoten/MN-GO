import React from 'react';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import LogOutButton from '../LogOutButton/LogOutButton';
import './Nav.css';
import mapStoreToProps from '../../redux/mapStoreToProps';

const Nav = (props) => {
  let loginLinkData = {
    path: '/login',
    text: 'Login / Register',
  };

  if (props.store.user.id != null) {
    loginLinkData.path = '/user';
    loginLinkData.text = 'Home';
  }

  return (
    <div className="nav">
        <img className="nav-title" src="/images/MN_GO_Logo.png"/>
      <div className="nav-right">
        <div className="dropdown">
          <img id="dropDownBtn" className="dropBtn" src="/images/PngItem_6342297.png"/>
          <div className="dropdown-content">
          <Link className="nav-link"  to="/user">Home</Link>
        
            {/* Show the link to the info page and the logout button if the user is logged in */}
            {props.store.user.id && (
              <>
                <Link className="nav-link" to="/info">
                  Info Page
                </Link>
                <LogOutButton className="nav-link" />
              </>
            )}
            {/* Always show this link since the about page is not protected */}
            <Link className="nav-link" to="/about">
              About
            </Link>
          </div>
        </div>
        <Link className="nav-link" to={loginLinkData.path}>
          {/* Show this link if they are logged in or not,
          but call this link 'Home' if they are logged in,
          and call this link 'Login / Register' if they are not */}
          {loginLinkData.text}
        </Link>
      </div>
    </div>
  );
};

export default connect(mapStoreToProps)(Nav);
