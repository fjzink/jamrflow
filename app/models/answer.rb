class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answerer, class_name: :User
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :content, presence: true

  def points
    votes.sum(:value)
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end

    def create_route_string
    "/answers/#{self.id}"
  end

end
