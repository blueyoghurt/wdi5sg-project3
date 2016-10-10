class BizownersReview < ApplicationRecord
  belongs_to :listing
  has_many :bizowners
  has_many :jobseekers
end
