class Api::V1::QuizzsController < ApplicationController

    def index
    quizzs = Quizz.select(:id, :title);
    render json: {message: "Success", data: quizzs, user: session[:user_id] }, status: :ok
    end
    def show
        quizz = Quizz.select(:id, :title).where(id: params[:id])
        if quizz.empty?
            render json: {message: "Don't exists"}, status: 400
        else
        question_count = Question.where(quizz_id: params[:id]).count
        render json: {data: quizz, nbQuestion: question_count}, status: :ok
        end
    end
    def create
        quizz = Quizz.new(quizz_params)
        if quizz.save
            render json: {message: 'quizz created', data: quizz }, status: 201
            else
                render json: {message: 'quizz not created'},status: 400
            end
    end

    def destroy
        begin
        quizz = Quizz.find(params[:id])
        quizz.destroy
        render json: {message: "Record deleted successfully"}, status: :ok
        rescue
            render json: {message: "Don't exists"}, status: 400
        end
    end
    def update
    begin
        quizz = Quizz.find(params[:id])

        if quizz.update_attributes(quizz_params)
            render json: {message: "Record updated successfully"}, status: :ok
        else
            render json: {message: "Record error"}, status: 400
        end

        rescue
            render json: {message: "Don't exists"}, status: 400
        end
    end

    private

    def quizz_params
        params.permit(:title)
    end
end
