class Application < ApplicationRecord
    belongs_to :listing
    has_many :jobseekers
end
