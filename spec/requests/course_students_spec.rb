require 'rails_helper'

RSpec.describe "Course students (classrooms) requests", type: :request do
  let(:course) { create :course }
  let(:student_1) { create :student }
  let(:student_2) { create :student }
  let(:student_3) { create :student }

  describe "GET /api/courses/:course_id/students" do
    it 'returns a list of students for a given course' do
      # Add students 1 and 2 to course
      Classroom.create student: student_1, course: course
      Classroom.create student: student_2, course: course

      # ensure student 3 is created
      student_3

      get api_course_students_path(course_id: course.id)
      json_response = JSON.parse(response.body)

      expect(json_response['students'].count).to eq 2

      course_students = json_response['students'].map { |student_attributes|
        Student.find student_attributes['id']
      }

      expect(course_students).to include student_1, student_2
      expect(course_students).not_to include student_3
    end
  end

  describe "POST /api/courses/:course_id/students/:student_id" do
    it 'adds a new student to a course' do
      post api_course_student_add_student_to_course_path(course_id: course.id, student_id: student_1.id)
      json_response = JSON.parse(response.body)
      expect(json_response).to have_key 'student'

      course.reload
      expect(course.students).to include student_1
    end

    it 'returns with 422: unprocessable entity if the student is already on the course' do
      # Add student 1
      Classroom.create student: student_1, course: course

      # Make a request to include student 1 again
      post api_course_student_add_student_to_course_path(course_id: course.id, student_id: student_1.id)
      expect(response).to have_http_status 422

      course.reload
      expect(course.students).to include student_1
    end
  end

  describe "DELETE /api/courses/:course_id/students/:student_id" do
    it 'removes a student from a course' do
      # Add student 1
      Classroom.create student: student_1, course: course

      delete api_course_student_remove_student_from_course_path(course_id: course.id, student_id: student_1.id)
      json_response = JSON.parse(response.body)
      expect(json_response).to have_key 'student'

      course.reload
      expect(course.students).not_to include student_1
    end

    it "returns with 404: not found if the student isn't on the course" do
      # Make a request to include student 1 again
      delete api_course_student_add_student_to_course_path(course_id: course.id, student_id: student_1.id)
      expect(response).to have_http_status 404

      course.reload
      expect(course.students).not_to include student_1
    end
  end
end
