class Api::V1::InformationController < ApplicationController
  def index
    info = Information.all
    render json: {message: "Success", data: info}, status: :ok
  end
  def update
    user_logged = User.where(token: "log").first
    info = Information.where(user_id: user_logged.id, quizz_id: params[:quizz_id])
      if info.empty?
        render json: {message: "You don't have any score for this quizz !"}, status: 400
      else
        begin
          info.first.update_attributes(score: 0)
        render json: {message: "Success", data: info.first.score}, status: :ok
      rescue
        render json: {message: "Failure"}, status: 400

      end
      end
  end
  def quizzScore
    user_logged = User.where(token: "log").first
    info = Information.where(user_id: user_logged.id, quizz_id: params[:quizz_id])
    if info.empty?
  render json: {message: "You don't have any score for this quizz !"}, status: 400
    else
      render json: {message: "Success", data: info.first.score}, status: :ok
    end
  end
end
