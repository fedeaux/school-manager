class Course < ApplicationRecord
  has_enumeration_for :status, create_helpers: true, create_scopes: true

  validates :name, presence: true
  validates :status, presence: true

  has_many :classrooms
  has_many :students, through: :classrooms
end
