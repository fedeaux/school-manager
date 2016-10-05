angular.module('SchoolManagerApp').factory 'Student', ->
  class Student
    constructor: (attributes = {}) ->
      @setAttributes attributes

    setAttributes: (attributes) ->
      for name, default_value of @defaultAttributes()
        if attributes.hasOwnProperty(name) and attributes[name] != null
          @[name] = attributes[name]
        else
          @[name] = default_value

    isPersisted: ->
      !! @id

    defaultAttributes: ->
      attr =
        id: null
        name: null
        register_number: null
        status: {}

      attr

    attributes: ->
      attr = {}

      for name, default_value of @defaultAttributes()
        attr[name] = @[name]

      attr.status = @status.id

      attr
