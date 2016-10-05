class Student < ApplicationRecord
  validates :name, presence: true
  validates :register_number, presence: true
  validates :status, presence: true
  has_enumeration_for :status, create_helpers: true, create_scopes: true
end
