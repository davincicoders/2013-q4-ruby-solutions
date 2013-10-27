class RacingGoat < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :gender, inclusion: { in: ["male", "female"] }
end
