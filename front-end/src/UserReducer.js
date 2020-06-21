import Cookies from 'js-cookie';


export function UserReducer(state, action) {
    switch (action.type) {
      case "login":
        return {user:action.id,type:action.type};
      case "logout":
        Cookies.remove('token')
        return { user: null,type:action.type};
    }
}
