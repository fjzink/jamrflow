class User < ActiveRecord::Base
  has_many :questions, foreign_key: :questioner_id
  has_many :answers, foreign_key: :answerer_id
  has_many :comments, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(inputted_username, inputted_password)
    user = self.find_by(username: inputted_username)
    if user
      if user.password == inputted_password
        user
      end
    else
      nil
    end
  end
end
