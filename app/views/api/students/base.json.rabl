attributes :id, :name, :register_number, :status

node :status do |student|
  {
    id: student.status,
    text: student.status_humanize
  }
end
