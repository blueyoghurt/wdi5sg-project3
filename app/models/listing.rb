class Listing < ApplicationRecord
  belongs_to :bizowner
  has_many :applications
end