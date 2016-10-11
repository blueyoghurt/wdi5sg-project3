class BizownersReview < ApplicationRecord
  belongs_to :bizowner
  belongs_to :jobseeker
  belongs_to :application
end
