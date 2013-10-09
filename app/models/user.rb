require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  validates :full_name, presence: true
  validates :email, uniqueness: true
  # validates :password, presence: true


  def password
      @password ||= Password.new(password_hash)
  end

  def password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end


  def authenticate(input_password)
    self.password == input_password
  end



end












# def self.authenticate(email, password)
#     user = User.find_by_email(email)
#     if user.password = password
#       return user
#     else
#       return nil
#     end
#   end

#   def foobar
#     @foobar
#   end

#   def foobar=(new_foobar)
#     @foobar = new_foobar
#   end
