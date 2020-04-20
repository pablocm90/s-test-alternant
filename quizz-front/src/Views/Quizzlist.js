import React, { useState, useEffect } from 'react';
import {Link} from "react-router-dom";
import axios from 'axios';


function Quizzlist() {
    const url = `http://localhost:3000/api/v1/quizzs`;
   
    const [quizzs, setQuizzs] = useState(null);
      let listQuizz = null
    useEffect(() => {
      axios.get(url)
          .then(response => {
              console.log(response);
              setQuizzs(response.data);
           })
    }, [url])
  
    if(quizzs) {
        listQuizz = 
         <ul className="list-group">
         {quizzs.data.map(quizz =>
          <li key= {quizz.id } className="list-group-item"><Link to={`quizz/${quizz.id}`}>{quizz.title} </Link> {quizzs.user}</li>)}</ul>

  
    } 
    return (
     
      <div>

          <div className="card-body">
          <h1>Quizzs</h1>
          
          </div>
  
          <div className="card_body">
              <div className="container">
              <p className="card-text">
          </p>
              </div>
              <div>
                  {listQuizz}
              </div>
              
              </div>
          </div>
    );
}
export default Quizzlist;

