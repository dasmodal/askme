class QuestionsController < ApplicationController
  before_action :set_question, only: %i[destroy edit hide show update]

  def create
    question = Question.create(question_params)

    redirect_to question_path(question), notice: 'Новый вопрос создан!'
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Вопрос удалён.'
  end

  def edit; end

  def hide
    @question.update(hidden: true)

    redirect_to question_path
  end

  def index
    @question = Question.new
    @questions = Question.by_recently_created
  end

  def new
    @question = Question.new
  end

  def show; end

  def update
    @question.update(question_params)

    redirect_to question_path(@question), notice: 'Сохранили вопрос!'
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :user_id)
  end
end
