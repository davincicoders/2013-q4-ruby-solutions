class Order < ActiveRecord::Base
  belongs_to :material, class_name: "Material", foreign_key: "material_id"

  validates :material_id, presence: true
  validates :num_linear_inches, presence: true

end
