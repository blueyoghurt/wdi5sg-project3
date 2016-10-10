class Bizowner < ApplicationRecord
  belongs_to :user
  has_many :listings

  #VALIDATIONS
  validates :user_id,
  uniqueness: true
end
