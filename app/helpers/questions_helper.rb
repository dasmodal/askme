module QuestionsHelper
  def hashtags_link(text)
    text.gsub(/#[[:word:]-]+/) do |htag|
      htag_param = htag.delete('#').downcase
      
      link_to htag, hashtag_path(htag_param)
    end
  end
end
