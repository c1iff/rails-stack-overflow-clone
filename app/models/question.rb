class Question < ActiveRecord::Base
  validates :content, :presence => true

  has_many :answers
  belongs_to :user
end
