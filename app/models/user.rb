class User < ApplicationRecord
  #ASSOCIATIONS
  has_one :jobseeker
  has_one :bizowner

  # CONSTANTS
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # MIXINS
  has_secure_password

  # VALIDATIONS
  validates :first_name,
  presence: true,
  length: { in: 3..50 }

  validates :last_name,
  presence: true,
  length: { in: 3..50 }

  validates :email,
  presence: true,
  length: { maximum: 255 },
  uniqueness: {case_sensitive: false},
  format: VALID_EMAIL_REGEX

  validates :password, length: { in: 8..72 } , on: :create, :if => :password_needs_validating?

  # custom method to ensure we have atleast one admin user
  validate :atleast_one_admin

  # HOOKS
  before_save :downcase_fields

  # PUBLIC METHODS
  def name
    "#{first_name.titlecase} #{last_name.titlecase}"
  end

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end

  # PRIVATE METHODS
  private

  def atleast_one_admin
    if is_admin == false && User.where(:is_admin => true).count < 2
      errors.add(:base, "There must be at least 1 admin user")
    end
  end

  def password_needs_validating?
    if new_record? || password.present?
      true
    else
      false
    end
  end

  def downcase_fields
    self.email = email.downcase
    self.first_name = first_name.downcase
    self.last_name = last_name.downcase
  end


end
