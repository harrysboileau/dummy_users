class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :full_name, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  def self.authenticate(email, password)
    where(email: email, password: password).first
  end
end
