require 'rails_helper'

RSpec.describe "Courses requests", type: :request do
  describe "GET /api/courses" do
    it 'returns a list of courses' do
      create :course
      create :course
      create :course

      get api_courses_path
      json_response = JSON.parse(response.body)

      expect(json_response['courses'].count).to eq 3
    end
  end

  describe "GET /api/courses/:id" do
    it 'returns the course info' do
      course = create :course

      get api_course_path(course)
      json_response = JSON.parse(response.body)

      expect(json_response).to have_key 'course'
      expect(json_response['course']['name']).to eq course.name
    end
  end

  describe "POST /api/courses" do
    it 'creates a new course' do
      post api_courses_path, params: { course: attributes_for(:course) }
      json_response = JSON.parse(response.body)
      expect(json_response).to have_key 'course'
    end
  end

  describe "PUT /api/courses" do
    it 'updates a course' do
      course = create :course

      put api_course_path(course), params: { course: { name: 'Engineering' } }
      json_response = JSON.parse(response.body)
      expect(json_response).to have_key 'course'
      expect(json_response['course']['name']).to eq 'Engineering'
    end
  end
end
