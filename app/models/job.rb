class Job < ApplicationRecord
geocoded_by :address
after_validation :geocode
belongs_to :bizowner
has_many :applications, dependent: :destroy

def self.search(search,type)
  if search

    case type

    when "company_name"

      where('company_name LIKE ?', "%#{search}%")
    when "address"
      where('address LIKE ?', "%#{search}%")
    when "job_title"
      where('job_title LIKE ?', "%#{search}%")
    end
  else
    all
  end
end
end
