class Store < ApplicationRecord
  geocoded_by :address
after_validation :geocode

def self.search(search,type)
  if search

    case type
    when "name"
      where('name LIKE ?', "%#{search}%")
    when "address"
      where('address LIKE ?', "%#{search}%")
    when "title"
      where('title LIKE ?', "%#{search}%")
    end
  else
    all
  end
end
end
