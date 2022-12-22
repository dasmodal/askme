class QuestionWithHashtags
  def initialize(question:)
    @question = question
  end

  def save
    ActiveRecord::Base.transaction do
      @question.save!
      @question.hashtags = create_hashtags.each(&:save)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def update(params)
    @question.attributes = params
    save
  end

  private

  def create_hashtags
    find_hashtags.map { |htag| Hashtag.find_or_create_by(body: htag) }
  end

  def find_hashtags
    "#{@question.body} #{@question.answer}"
      .downcase
      .scan(/#[[:word:]-]+/)
      .uniq
      .map { |htag| htag.delete('#')}
  end
end
