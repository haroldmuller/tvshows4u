class Relationship < ApplicationRecord
  belongs_to :father, class_name: "User"
  belongs_to :child, class_name: "User"
  validates :father_id, presence: true
  validates :child_id, presence: true
end
