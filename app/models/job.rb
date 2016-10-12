class Job < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  belongs_to :bizowner
  has_many :applications, dependent: :destroy

  #VALIDATIONS
  validates :bizowner_id,
  presence: true

  def self.search(search,type)
    if search
      case type
      when "company"
        where('company_name LIKE ?', "%#{search}%")
      when "address"
        where('address LIKE ?', "%#{search}%")
      when "title"
        where('title LIKE ?', "%#{search}%")
      else
        all
      end
    end
  end
end
