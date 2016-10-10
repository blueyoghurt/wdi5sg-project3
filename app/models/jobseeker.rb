class Jobseeker < ApplicationRecord
  belongs_to :user
  has_many :applications

  #VALIDATIONS
  validates :user_id,
  uniqueness: true

end
