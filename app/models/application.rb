class Application < ApplicationRecord
    belongs_to :listing
    belongs_to :jobseeker
    has_one :bizowners_review, dependent: :destroy
    has_one :jobseekers_review, dependent: :destroy

end
