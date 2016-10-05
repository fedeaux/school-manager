class Student < ApplicationRecord
  has_enumeration_for :status, create_helpers: true, create_scopes: true

  validates :name, presence: true
  validates :register_number, presence: true
  validates :status, presence: true

  has_many :classrooms
  has_many :courses, through: :classrooms

  def signature
    "#{name} (#{register_number})"
  end

  def self.as_options
    all.map { |student|
      {
        id: student.id,
        signature: student.signature,
      }
    }
  end
end
