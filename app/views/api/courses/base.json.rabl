attributes :id, :name, :description

node :status do |course|
  {
    id: course.status,
    text: course.status_humanize
  }
end
