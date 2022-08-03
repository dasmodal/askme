class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Question.create(
      body: params[:question][:body],
      user_id: params[:question][:user_id]
      )
  end

  def destroy
    Question.destroy(params[:id])
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(
      body: params[:question][:body],
      user_id: params[:question][:user_id]
    )
  end
end
