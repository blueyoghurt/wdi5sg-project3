class Application < ApplicationRecord
    belongs_to :job
    belongs_to :jobseeker
    has_one :bizowners_review
    has_one :jobseekers_review

    #VALIDATIONS
    validates :job_id,
    uniqueness: {scope: :jobseeker_id}
end
