class Job < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  belongs_to :bizowner
  has_many :applications, dependent: :destroy

  #VALIDATIONS
  validates :bizowner_id,
  presence: true

  before_save :downcase_fields

  def downcase_fields
    self.company_name.downcase!
    self.job_title.downcase!
    self.job_description.downcase!
    self.address.downcase!
    self.industry.downcase!
  end

  def self.search(search,type)
    if search
      case type
      when "address"
        where('address LIKE ?', "%#{search}%")
      when "company_name"
        where('company_name LIKE ?', "%#{search}%")
      when "job_title"
        where('job_title LIKE ?', "%#{search}%")
      else
        scoped
      end
    else
      all
    end
  end
end
