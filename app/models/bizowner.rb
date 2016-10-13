class Bizowner < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bizowners_reviews, dependent: :destroy
  has_many :jobseekers_reviews, dependent: :destroy
  has_many :jobs

  #VALIDATIONS
  validates :user_id,
  uniqueness: true
end
