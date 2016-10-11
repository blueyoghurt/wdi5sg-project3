class Application < ApplicationRecord
    belongs_to :listing
    belongs_to :jobseeker
    has_one :bizowners_review, dependent: :destroy
    has_one :jobseekers_review, dependent: :destroy

    #VALIDATIONS
    validates :listing_id,
    uniqueness: {scope: :jobseeker_id}
end
