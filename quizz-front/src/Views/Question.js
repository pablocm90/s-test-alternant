import React, { useState, useEffect } from 'react';
import {useParams} from "react-router-dom";

import axios from 'axios';
import '../App.css';


function Question() {

    const { id } = useParams()
    const url = `http://localhost:3000/api/v1/quizzs/${id}/questions/`;
    let urlAnswer
    const [questions, setQuestions] = useState(null);
    const [start, setStart] = useState(0);
    const [answer, setAnswer] = useState('')
    const [nb, setNb] = useState(0)

    let question_entity = null

    useEffect(() => {
      axios.get(url)
          .then(response => {
            setNb(response.data.data.length) 
            setQuestions(response.data);

           })

    }, [url])
  
  const data = {
  input_response: answer,
  };
  if(questions !== null && start < nb)
    urlAnswer =`http://localhost:3000/api/v1/quizzs/${id}/questions/${questions.data[start].id}/answer`;

  

  var handleChange = e => {
   setAnswer(e.target.value)
 }
  var handleSubmit = e => {
    e.preventDefault();

    axios.post(urlAnswer, data)
    .then(res =>
       document.getElementById("form-response").reset()
    )
    .catch(err => console.log(err));
      setStart(start + 1)
  }
    if(questions && start < nb) {
        question_entity =
            <form onSubmit={handleSubmit} id="form-response" >    
              <div className="question-container">
                <h1>Question {start + 1}</h1>

                <div className="question">
                
                  <h2>{questions.data[start].question}</h2>
                  <div className="buttons">
                    <label htmlFor="response1"> 1 : {questions.data[start].response1}</label>
                    <input className="response btn btn-primary  "  value="1" type="radio" name="radio-response" onChange={handleChange} />
                  
                    <label htmlFor="response1"> 2 : {questions.data[start].response2}</label>
                    <input className="response btn btn-primary " value="2" type="radio" name="radio-response" onChange={handleChange} />

                    <label htmlFor="response1"> 3 : {questions.data[start].response3}</label>
                    <input className="response btn btn-primary " value="3" type="radio" name="radio-response" onChange={handleChange} />

                    <label htmlFor="response1"> 4 : {questions.data[start].response4}</label>
                    <input className="response btn btn-primary " value="4" type="radio" name="radio-response" onChange={handleChange} />
                  </div>
                </div>
                <div className="submit-container">
                  <button className="btn btn-primary btn-lg" type="submit">Submit</button>
                </div> 
                    
              </div>
            </form>
  
    } else {
      question_entity =
      <div>
        <h1>There is nothing here... 👀</h1>
        <p>Click here to see your <a href={`/quizz/${id}`}>Score</a></p>

      </div>;
    }
    return (  
      <div>
          <div className="card-body">
              {question_entity}
          </div>
      </div>
    );
}
export default Question;

