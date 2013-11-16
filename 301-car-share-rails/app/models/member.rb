class Member < ActiveRecord::Base
  has_many :cars, class_name: "Car", foreign_key: "member_id"

  validates :username, presence: true
  validates :username, uniqueness: true

  has_secure_password
end
