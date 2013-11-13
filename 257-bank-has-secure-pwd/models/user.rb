class User < ActiveRecord::Base
  has_many :accounts, class_name: "Account", foreign_key: "user_id"

  validates :username, uniqueness: true, presence: true

  has_secure_password
end
