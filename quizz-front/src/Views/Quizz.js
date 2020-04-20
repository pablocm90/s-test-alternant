import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Switch, Route, Link} from "react-router-dom";

import {useParams} from "react-router-dom";

import axios from 'axios';

function Quizz() {
    const { id } = useParams()

    const url = `http://localhost:3000/api/v1/quizzs/${id}`;
    const urlScore = `http://localhost:3000/api/v1/score?quizz_id=${id}`
    const urlDelete = `http://localhost:3000/api/v1/infos/set?quizz_id=${id}`

    const [quizz, setQuizz] = useState(null);
    const [score, setScore] = useState(null);

    let quizz_entity = null
    let score_entity = null
    
    useEffect(() => {
      axios.get(url)
          .then(response => {
              setQuizz(response.data);
           })
    }, [url])

    useEffect(() => {
        axios.get(urlScore)
            .then(response => {
                console.log(response);
                 setScore(response.data.data);
             })
      }, [urlScore])

     var handleSubmit = e => {
        axios.put(urlDelete)
            .then(response => {
                console.log(response);
            })
            window.location.reload(); 
        }
    
     
    if(quizz) {
        quizz_entity =
        <div className="quizz">
            <h2>{quizz.data[0].title}</h2>
            <p>There is {quizz.nbQuestion} question(s) to answer</p>
                <Link className="btn btn-primary btn-lg" to={`/questions/${id}`} >Start the quizz !</Link>      
        </div>

    } else {
        quizz_entity = 
        <div className="unauthorized">
            <h1>There is nothing here...</h1>
        </div>

    }

    if(score) {
        score_entity =
        <div>
            <h1>Your score is {score}  </h1>
            <button className="btn btn-danger btn-lg" onClick={handleSubmit}>DELETE Score</button>
        </div>

        if(score >= 60) {
            score_entity =
             <div>
                <h1>You won ! Your score is {score} </h1>
                <button className="btn btn-danger btn-lg" onClick={handleSubmit}>DELETE Score</button>
             </div>
         }
    } else {
        score_entity = 
        <div>
            <h1>You don't have any score in this Quizz</h1>
        </div>
    }
    return (
     
      <div>
          <div className="card-body">
            <h1>Quizz</h1>
          </div>
          
          <div className="card_body">
              <div className="container">
              <p className="card-text">
          </p>
              </div>
              <div>
                  {quizz_entity}
              </div>
              {score_entity}
              </div>
          </div>
    );
}
export default Quizz;

