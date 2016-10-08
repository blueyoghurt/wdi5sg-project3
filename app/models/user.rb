class User < ApplicationRecord

  validates :password, length: { in: 8..72 }, on: :create

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  has_secure_password

  # PUBLIC METHODS
  def name
    "#{first_name.titlecase} #{last_name.titlecase}"
  end
  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end

end
