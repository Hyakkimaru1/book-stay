import Cookies from 'js-cookie';


export function UserReducer(state, action) {
    switch (action.type) {
      case "login":
        return {user:action.id,ten:action.ten?action.ten:action.email,email:action.email,sdt:action.sdt,type:action.type,avt:action.avt,admin:action.admin};
      case "logout":
        Cookies.remove('token')
        return { user: null,type:action.type};
      default:
        return { user: null,type:"logout"};
    }
}
