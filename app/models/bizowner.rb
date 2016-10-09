class Bizowner < ApplicationRecord
  belongs_to :user, optional: true
end
