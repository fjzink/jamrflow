class Question < ActiveRecord::Base
  belongs_to :questioner, class_name: :User
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :title, :content, presence: true

  def points
    votes.sum(:value)
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end

end
