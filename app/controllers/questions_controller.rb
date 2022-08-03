class QuestionsController < ApplicationController
  def create
    question = Question.create(
      body: params[:question][:body],
      user_id: params[:question][:user_id]
      )

    redirect_to question_path(question)
  end

  def destroy
    Question.destroy(params[:id])

    redirect_to questions_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
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

    redirect_to question_path(@question)
  end
end
