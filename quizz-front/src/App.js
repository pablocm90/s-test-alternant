import React from 'react';
import { BrowserRouter as Router, Switch, Route} from "react-router-dom";
import axios from 'axios';
import Cookies from 'js-cookie'

import './App.css';

import Login from './Views/Login'
import Signup from './Views/Signup'
import Quizzlist from './Views/Quizzlist'
import Quizz from './Views/Quizz'
import Question from './Views/Question'

function App() {

  var quizzsElement;
  var quizzElement;
  var questionElement;
  var loginElement;

  var handleSubmit = e => {
    e.preventDefault();
    axios
    .post("http://localhost:3000/api/v1/logout")
    .then(res => {  
      Cookies.remove('user');
      window.location.reload(); 
    })
    .catch(err => console.log(err));
  }
    
  var user = "";
  var isLogged = false;

  user = Cookies.get('user');
    if (user === undefined) {
      user = "Guest";
      isLogged = false; 
    }
    else {
      user = Cookies.get('user'); 
      isLogged = true; 
    }

    if (!isLogged) {
      questionElement = quizzElement = quizzsElement =
       <div className="unauthorized">
        <h1>Please Log in !</h1>
        <p>If you want to see our quizzs please log in or sign up</p>
       </div>
        loginElement = <Login />
    } else {
      quizzsElement = <Quizzlist />
      questionElement = <Question />
      quizzElement = <Quizz/>
      loginElement =
       <div className="unauthorized">
        <h1>Already Logged in !</h1>
        <p>If you are not {user}, Please log out</p>
       </div>
    }
return (
 
<div className="App">
  <header>
    <nav className="navbar navbar-expand-md navbar-dark fixed-top bg-dark">

    <a className="navbar-brand" href="/">Quizz app</a>
    <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span className="navbar-toggler-icon"></span>
    </button>

    <div className="collapse navbar-collapse" id="navbarCollapse">
      <ul className="navbar-nav mr-auto">
        <li className="nav-item active">
          <a className="nav-link" href="/quizzs">Quizzs</a>
        </li>

        { !isLogged &&
          <div className="guest-items">
            <li className="nav-item">
              <a className="nav-link" href="/login">Log in</a>
            </li>
            <li className="nav-item">
                <a className="nav-link" href="/signup">Sign up</a>
            </li> 
          </div>
        }
          
          <div className="user-dashboard">
            <li className="nav-item">
              <button className="btn btn-info btn-user">{user}</button>
            </li>
            { isLogged &&
              <li className="nav-item">
                <button className="btn btn-primary btn-user" onClick={handleSubmit}>Log out</button>
              </li>
            }
        </div>
      </ul>
    </div>
    </nav>
  </header>

  <main className="text-center">
      <Router>
        <Switch>
          <Route exact path="/">
          <div className="welcome">
            <h1>Welcome to the Quizz app</h1>
            <p>Let's try some quizzs</p>
          </div>
          </Route>
          <Route path="/signup">
            <Signup/>
          </Route>
          <Route path="/login">
              {loginElement}
            </Route>
          <Route path="/quizzs">
              {quizzsElement}
          </Route>
          <Route path="/quizz/:id">
              {quizzElement}
          </Route>
          <Route path="/questions/:id">
              {questionElement}
          </Route>
        </Switch>
      </Router>
  </main>

</div>
  );

}


export default App;
