class HashtagsController < ApplicationController
  def show
    @questions = Hashtag.find_by!(body: params[:body]).questions

    if @questions.empty?
      redirect_to root_path, alert: 'Нет вопросов с таким хэштегом. Будь первым!'
    end
  end
end
