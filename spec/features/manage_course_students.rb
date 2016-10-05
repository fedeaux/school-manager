require 'rails_helper'

RSpec.describe 'Manage Course Students', js: true do
  let(:course) { create :course }
  let(:student_1) { create :student }
  let(:student_2) { create :student }
  let(:student_3) { create :student }

  it 'displays a given course and a message warning that there are no students' do
    visit "/#/courses/#{ course.id }"
    expect(page).to have_css '#empty-course-message'
  end

  it 'allows a student to be added to the course' do
    student_1
    student_2
    student_3
    visit "/#/courses/#{ course.id }"

    select(student_1.id, from: 'classroom[student]')
    find('#add-student-button').click

    expect(page).to have_css "#student-list-item-#{student_1.id}"
  end

  it 'allows a student to be removed from the course' do
    student_1
    Classroom.create course: course, student: student_1
    visit "/#/courses/#{ course.id }"

    expect(page).to have_css "#student-list-item-#{student_1.id}"
    find("#student-list-item-#{student_1.id} .student-list-remove-from-course-button").click

    expect(page).not_to have_css "#student-list-item-#{student_1.id}"
  end
end
