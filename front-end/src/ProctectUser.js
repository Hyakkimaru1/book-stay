import React, {  useContext } from 'react';
import {UserContext} from './UserContext';
import {
  Route,
  Redirect,
  useLocation
} from 'react-router-dom';

function ProctectUser({ children, ...rest }) {
    const [state] = useContext(UserContext);
    const location = useLocation();
    return (
      <Route
        {...rest}
        render={() =>
          state.type==='login' ? (
            children
          ) : (
            <Redirect
              to={{
                pathname: "/login",
                state: {from:location.pathname+location.search}
              }}
            />
          )
        }
      />
    );
}

export default ProctectUser;