import React, { useContext } from "react";
import { UserContext } from "./UserContext";
import {
  Route,
  Redirect,
  useLocation,
} from "react-router-dom";

function ProctectUser({ children, ...rest }) {
  const [state] = useContext(UserContext);
  const location = useLocation();
  return (
    <Route
      {...rest}
      render={() =>
        state.admin
          ? (
            children
          )
          : (
            <Redirect
              to={{
                pathname: "/ERROR",
              }}
            />
          )}
    />
  );
}

export default ProctectUser;
