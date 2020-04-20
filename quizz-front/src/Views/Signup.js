import React, {useState} from 'react';
import { Redirect} from "react-router-dom";
import axios from 'axios';
import '../App.css';


function Signup() {

const [username, setUsername] = useState("");
const [password, setPassword] = useState("")
const [email, setEmail] = useState("")
const [redirect, setRedirect] = useState(false)


var renderRedirect = () => {
  if (redirect) {
    return <Redirect to='/login' />
  }
}

var onUsernameChange = e => {
    setUsername(e.target.value)
}

var onEmailChange = e => {
    setEmail(e.target.value)
}

var onPasswordChange = e => {
    setPassword(e.target.value)
}
var handleSubmit = e => {
    e.preventDefault();
    const data = {
      username: username,
      password: password,
      email: email
    };
    axios
      .post("http://localhost:3000/api/v1/users", data)
      .then(res =>  {
           setRedirect(true)
       } )
      .catch(err => console.log(err));
  };


  return (

    <div className="form-container">

      <form class="form-signin" onSubmit={handleSubmit}>
      <h1 className="h3 mb-3 font-weight-normal">Please Sign up</h1>

      <input type="text" value={username} onChange={onUsernameChange}   className=" input-form  form-control" placeholder="Username"   />
      <input type="e-mail" value={email} onChange={onEmailChange}   className=" input-form  form-control" placeholder="E-mail"  />
      <input type="password" value={password} onChange={onPasswordChange}   className=" input-form  form-control" placeholder="Password"  />
      
      <button className="submit-btn btn btn-lg btn-primary btn-block"  type="submit">Sign up</button>

      </form>

      {renderRedirect()}

    </div>
                
  );
}

export default Signup;