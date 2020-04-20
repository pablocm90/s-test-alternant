class Api::V1::QuestionsController < ApplicationController


  def index

     questions = Question.where(quizz_id: params[:quizz_id])
      if !questions.empty?
          render json: {data: questions, user_id: session[:user_id]}, status: :ok
      else
          render json: {message: "No questions"}, status: 400
      end

  end

  def show

      question = Question.where(quizz_id: params[:quizz_id], id: params[:id])
      if !question.empty?
          render json: {data: question}, status: :ok
      else
          render json: {message: "Don't exists"}, status: 400
      end
  end

  def create
      question = Question.new(question_params)
      question.quizz_id = params[:quizz_id]
      if question.save
          render json: {message: 'Question created', data: question }, status: 201
          else
              render json: {message: 'Question not created'},status: 400
          end
  end

  def destroy
      question = Question.where(quizz_id: params[:quizz_id])
      if !question.empty?
          question.destroy(params[:id])
          render json: {message: "Record deleted successfully"}, status: :ok
      else
          render json: {message: "Don't exists"}, status: 400
      end
  end

  def update
      begin
      question = Question.find(params[:id])
      question.update_attributes(question_params)
          render json: {message: "Record updated successfully"}, status: :ok
      rescue
          render json: {message: "Don't exists"}, status: 400
      end
  end
  def answer
    user_logged = User.where(token: "log").first
    question = Question.find(params[:question_id])
    question_quizz = Question.where(quizz_id: params[:quizz_id])
    answer = Question.find(params[:question_id]).answer
    response = params[:input_response]
    isCorrect = false
    count = question_quizz.count
     if response == answer.to_s && user_logged != nil
        isCorrect = true

       info = Information.where(quizz_id: params[:quizz_id], user_id: user_logged.id)

          if !info.empty?
              old_score = info.first.score
              if old_score < 100
                info.update(score: old_score + (100/count))
              end
              render json: {message: "Informations updated"}, status: 200
          else
            info = Information.new
            info.quizz_id = params[:quizz_id]
            info.user_id = user_logged.id
            info.score = 100/count

              if info.save
                  render json: {message: "Informations saved",  isCorrect: isCorrect}, status:200
              else
                  render json: {message: "Failure"}, status: 400
              end

        end
      else
        render json: {message: "False"}, status: 200
     end



  end
  private
  def question_params
      params.permit(:question, :response1,:response2,:response3,:response4, :answer)
  end


  end
