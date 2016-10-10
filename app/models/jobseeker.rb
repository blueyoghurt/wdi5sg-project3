class Jobseeker < ApplicationRecord
  belongs_to :user, optional: true
  has_many :applications
end
