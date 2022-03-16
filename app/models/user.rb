class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation:true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  def create
  if user = User.authenticate_with_credentials(params[:email], params[:password])
    # success logic, log them in
  else
    # failure, render login form
  end
end
end