class QuestionsController < ApplicationController
  before_action :set_question, only: %i[destroy edit hide show update]

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to user_path(@question.user), notice: 'Новый вопрос создан!'
    else
      render :new
    end
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Вопрос удалён.'
  end

  def edit; end

  def hide
    @question.update(hidden: true)

    redirect_to root_path
  end

  def index
    @question = Question.new
    @questions = Question.by_recently_created
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def show; end

  def update
    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: 'Сохранили вопрос!'
    else
      render :new
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :user_id)
  end
end
