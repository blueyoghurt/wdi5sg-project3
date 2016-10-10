class Jobseeker < ApplicationRecord
  belongs_to :user, optional: true
end
