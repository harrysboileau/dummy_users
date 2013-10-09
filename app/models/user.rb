class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :full_name, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user.password = password
      return user
    else
      return nil
    end
  end
end
