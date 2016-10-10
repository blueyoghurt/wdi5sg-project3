class JobseekersReview < ApplicationRecord
  belongs_to :listing
  belongs_to :bizowner
  belongs_to :jobseeker
end
