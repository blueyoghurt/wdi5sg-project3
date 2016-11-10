class JobseekersReview < ApplicationRecord
  belongs_to :bizowner, dependent: :destroy
  belongs_to :jobseeker, dependent: :destroy
  belongs_to :application, dependent: :destroy
end
