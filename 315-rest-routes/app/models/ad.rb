class Ad < ActiveRecord::Base
  validates :company_name, presence: true
  validates :duration,     presence: true
end
