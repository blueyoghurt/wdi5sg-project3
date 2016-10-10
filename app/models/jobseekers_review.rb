class JobseekersReview < ApplicationRecord
  has_many :bizowners
  has_many :jobseekers
end
