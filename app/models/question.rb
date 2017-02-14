class Question < ActiveRecord::Base
  validates :content, :presence => true

  has_many :answers
  belongs_to :user

  def up_vote
    if self.rating === nil
      self.rating = 1
    else
      self.rating = self.rating + 1
    end
  end

  def down_vote
    self.rating = self.rating - 1
  end
end
