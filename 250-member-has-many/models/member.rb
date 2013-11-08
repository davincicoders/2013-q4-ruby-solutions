class Member < ActiveRecord::Base

  # Create a .cars method that can be called on any Member object.
  # It will query the cars table for rows with member_id matching
  # this object's id.  It will return a relation of Car objects.
  has_many :cars, class_name: "Car", foreign_key: "member_id"

end
