## Setup

### Quizz App Ruby on Rails + React
 - Clone the repo
 - The folder quizz-api has the RESTFUL API on it
 - Launch the API server with `rails server` in the root folder, it will run the API in *localhost:3000*
   - All the POST GET DESTROY PUT methods are located in *localhost:3000/api/v1*
 - Seed quizzs and questions by `rails db:seed`
 
 - The folder quizz-front has the Front side on it
 - Launch the react server with `npm start` in the root folder, it will run the React app in *localhost:4000*
 - To access to the quizzs you need log in
 - You can access to your score at the Quizz related dashboard -> If you have more than 60 % of the quizz right you win !
 

## Guidelines
- Fork this repository
- You can add any framework, library or plugin you'd like
- In short: Do whatever you want to get the job done
- Make sure the application works out-of-the box once you're done
- Push changes to your git fork
- Add a short description on how to run your program in the Setup section above. (A person ariving new to the project should be able to follow your instructions and run it)
- Check the finished features in the Assignment and Bonus section by putting an 'X' ([X]) in between the brackets
- Quality over quantity, better half of the features 100% done, than 100% of the features half-done
- Assignment :
  - You are asked to build a simple Quizz App

## User
 [X] A user can log in with a valid username and password through a login screen

 [X] A user can see a collection of quizzes

 [X] A user can start a quizz

 [X] A user can answer 3 questions on a quizz

 [X] A user can see the scores of his quizzes


## Quizz
 [X] A quizz has a Title

 [ ] A quizz has a maximum of 3 questions

 [X] A quizz is considered passed if +60% of questions are answered correctly

## Question
 [X] A question has a maximum of 4 answers

 [X] A question has only 1 possible correct answer


## Bonus
- Some nice to haves, when there is time to spare.

 [ ] A quizz can have a dificulty level

 [ ] Add or improve a feature of your own choice
