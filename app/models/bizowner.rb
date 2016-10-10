class Bizowner < ApplicationRecord
  belongs_to :user, optional: true
  has_many :listings
end
