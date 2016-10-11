class Application < ApplicationRecord
    belongs_to :listing, dependent: :destroy
    belongs_to :jobseeker, dependent: :destroy
    has_one :bizowners_review
    has_one :jobseekers_review

    #VALIDATIONS
    validates :listing_id,
    uniqueness: {scope: :jobseeker_id}
end
