class SubOrder < ActiveRecord::Base
  validates :sandwich_type, presence: true
  validates :bread_type,    presence: true
end
