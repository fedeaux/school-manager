class Status < EnumerateIt::Base
  associate_values(
    inactive:  0,
    active:    1
  )

  def self.to_array_of_objects
    to_a.map { |pair|
      {
        id: pair[1],
        text: pair[0]
      }
    }
  end
end
