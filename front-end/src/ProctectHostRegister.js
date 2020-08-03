import React, { useContext } from 'react';
import { UserContext } from './UserContext';
import {
  Route,
  Redirect
} from 'react-router-dom';

function ProtectHostRegister({ children, ...rest }) {
  const [state] = useContext(UserContext);
  return (
    <Route
      {...rest}
      render={() =>
        state.type === 'login' ? (
          children
        ) : (
            <Redirect
              to={{
                pathname: "/login",
                state: { from: "/host/register" }
              }}
            />
          )
      }
    />
  );
}

export default ProtectHostRegister;