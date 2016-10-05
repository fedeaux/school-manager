class Course < ApplicationRecord
  extend EnumerateIt
  validates :name, presence: true
  validates :status, presence: true
  has_enumeration_for :status, create_helpers: true, create_scopes: true
end
