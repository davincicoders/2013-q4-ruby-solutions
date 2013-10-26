class User < ActiveRecord::Base
  validates :email,      presence: true
  validates :email,      uniqueness: true
  validates :first_name, presence: true
  validates :age,        numericality: { greater_than_or_equal_to: 18 }
end
