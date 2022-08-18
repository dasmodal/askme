class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :by_recently_created, -> { order(created_at: :desc) }
end
