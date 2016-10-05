class Classroom < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :student, presence: true
  validates :course, presence: true
  validate :uniqueness

  def uniqueness
    if Classroom.where(student: student, course: course).any?
      errors.add(:uniqueness, "This student is already on this course")
    end
  end
end
