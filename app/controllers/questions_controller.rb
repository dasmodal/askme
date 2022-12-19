class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[destroy edit hide update]
  before_action :set_question_for_current_user, only: %i[destroy edit hide update]

  def create
    question_params = params.require(:question).permit(:body, :user_id, :author_id)
    question_params[:author] = current_user

    @question = Question.new(question_params)
    question_w_hashtags = QuestionWithHashtags.new(question: @question)

    if verify_recaptcha && question_w_hashtags.save
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
    @questions = Question.by_recently_created.first(10)
    @users = User.by_recently_created.first(10)
    @hashtags = Hashtag.with_questions
  end

  def new
    @user = User.find_by!(nickname: params[:user_nickname])
    @question = Question.new(user: @user)
  end

  def show
    @question = Question.find(params[:id])
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)
    question_w_hashtags = QuestionWithHashtags.new(question: @question)

    if question_w_hashtags.update(question_params)
      redirect_to user_path(@question.user), notice: 'Сохранили вопрос!'
    else
      render :new
    end
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
