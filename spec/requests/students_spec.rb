require 'rails_helper'

RSpec.describe "Students requests", type: :request do
  describe "GET /api/students" do
    it 'returns a list of students' do
      create :student
      create :student
      create :student

      get api_students_path
      json_response = JSON.parse(response.body)

      expect(json_response['students'].count).to eq 3
    end
  end

  describe "GET /api/students/:id" do
    it 'returns the student info' do
      student = create :student

      get api_student_path(student)
      json_response = JSON.parse(response.body)

      expect(json_response).to have_key 'student'
      expect(json_response['student']['name']).to eq student.name
    end
  end

  describe "POST /api/students" do
    it 'creates a new student' do
      post api_students_path, params: { student: attributes_for(:student) }
      json_response = JSON.parse(response.body)
      expect(json_response).to have_key 'student'
    end
  end

  describe "PUT /api/students" do
    it 'updates a student' do
      student = create :student

      put api_student_path(student), params: { student: { name: 'Jilian' } }
      json_response = JSON.parse(response.body)
      expect(json_response).to have_key 'student'
      expect(json_response['student']['name']).to eq 'Jilian'
    end
  end
end
