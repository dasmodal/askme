class QuestionsController < ApplicationController
  before_action :set_question, only: %i[destroy edit hide show update]

  def create
    question = Question.create(question_params)

    redirect_to question_path(question)
  end

  def destroy
    @question.destroy

    redirect_to questions_path
  end

  def edit; end

  def hide
    @question.hidden = true
    @question.save

    redirect_to question_path
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show; end

  def update
    @question.update(question_params)

    redirect_to question_path(@question)
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :user_id)
  end
end
