class Application < ApplicationRecord
    has_many :listings
    has_many :jobseekers
end
