class <%= controller_name %>
  constructor: (@scope, @state, @<%= model_name %>, @<%= service_name %>) ->
    window.ctrl = @
    @service = new @<%= service_name %>
    @form_<%= underscore_singular_name %> = null

    @load<%= camel_plural_name %>()

  load<%= camel_plural_name %>: ->
    @service.index @set<%= camel_plural_name %>

  set<%= camel_plural_name %>: (response) =>
    @<%= underscore_plural_name %> = {}

    if response.<%= underscore_plural_name %>
      for <%= underscore_singular_name %>_attributes in response.<%= underscore_plural_name %>
        @set<%= camel_singular_name %> <%= underscore_singular_name %>_attributes

      @updateAuxiliarDataStructures()

  <%= underscore_singular_name %>Updated: (response) =>
    @set<%= camel_singular_name %> response.<%= underscore_singular_name %>
    @clearForm<%= camel_singular_name %>()
    @updateAuxiliarDataStructures()

  set<%= camel_singular_name %>: (<%= underscore_singular_name %>_attributes) =>
    @<%= underscore_plural_name %>[<%= underscore_singular_name %>_attributes.id] = new @<%= model_name %> <%= underscore_singular_name %>_attributes

  updateAuxiliarDataStructures: =>
    @displayable_<%= underscore_plural_name %> = (<%= underscore_singular_name %> for id, <%= underscore_singular_name %> of @<%= underscore_plural_name %>)

  setForm<%= camel_singular_name %>: (<%= underscore_singular_name %>, form) ->
    if <%= underscore_singular_name %> and <%= underscore_singular_name %>.isPersisted()
      @original_form_<%= underscore_singular_name %> = angular.copy <%= underscore_singular_name %>

    @form_<%= underscore_singular_name %> = <%= underscore_singular_name %>
    form.$setPristine() if form

  setBlankForm<%= camel_singular_name %>: (form) ->
    @setForm<%= camel_singular_name %> (new @<%= model_name %>), form

  cancel<%= camel_singular_name %>Edit: (form) ->
    if @original_form_<%= underscore_singular_name %>
      @<%= underscore_plural_name %>[@original_form_<%= underscore_singular_name %>.id] = @original_form_<%= underscore_singular_name %>
      @updateAuxiliarDataStructures()

    @clearForm<%= camel_singular_name %> form

  clearForm<%= camel_singular_name %>: (form) ->
    @original_form_<%= underscore_singular_name %> = null
    @setForm<%= camel_singular_name %> null, form

  saveForm<%= camel_singular_name %>: (form) =>
    if form.$valid
      form.$setPristine()
      if @form_<%= underscore_singular_name %>.isPersisted()
        @service.update @form_<%= underscore_singular_name %>, @<%= underscore_singular_name %>Updated
      else
        @service.create @form_<%= underscore_singular_name %>, @<%= underscore_singular_name %>Updated

<%= controller_name %>.$inject = ['$scope', '$state', '<%= model_name %>', '<%= service_name %>']
angular.module('<%= ng_app_name %>').controller '<%= controller_name %>', <%= controller_name %>
