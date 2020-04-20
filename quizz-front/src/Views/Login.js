import React, {useState} from 'react';
import {Redirect} from "react-router-dom";
import axios from 'axios';
import Cookies from 'js-cookie'
import '../App.css';


function Login() {

const [password, setPassword] = useState("")
const [email, setEmail] = useState("")
const [redirect, setRedirect] = useState(false)

var renderRedirect = () => {
  if (redirect) {
    return <Redirect to='/quizzs' />
  }
}

var onEmailChange = e => {
    setEmail( e.target.value)
}

var onPasswordChange = e => {
    setPassword(e.target.value);
}

var handleSubmit = e => {
    e.preventDefault();

    const data = {
      email: email,
      password: password,  
    };

    axios.post("http://localhost:3000/api/v1/auth", data)
      .then(res =>  {
          console.log(res)
          Cookies.set('user', res.data.user_username)
          setRedirect(true);
          window.location.reload(); 
       })
      .catch(err => console.log(err));
}

  return (

    <div className="form-container">
      
      <form className="form-signin"  onSubmit={handleSubmit}>
      
      <h1 className="h3 mb-3 font-weight-normal">Please log in</h1>
      <input type="text" value={email} onChange={onEmailChange}   className=" input-form form-control" placeholder="E-mail" required  />
      <input type="password" value={password} onChange={onPasswordChange}   className="input-form form-control" placeholder="Password" required   />
      <button className="submit-btn btn btn-lg btn-primary btn-block"  type="submit">Log in</button>

      </form>

      {renderRedirect()}

    </div>
                
  );

}

export default Login;
 