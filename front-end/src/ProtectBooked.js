import React, {  useContext } from 'react';
import {UserContext} from './UserContext';
import {
  Route,
  Redirect,
  useLocation
} from 'react-router-dom';

function ProtectBooked({ children, ...rest }) {
    const [state, dispatch] = useContext(UserContext);
    const location = useLocation();
    //console.log(location.pathname);
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
                state: {from:location.pathname+location.search},
              }}
            />
          )
        }
      />
    );
}

export default ProtectBooked;