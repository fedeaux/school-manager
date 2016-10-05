# no-override

@DateFormats =
  db_day: 'YYYY-MM-DD'
  pretty_day: 'ddd, MMM Do'
  hour_and_minute: 'HH:mm'

init = ->

$(document).on 'page:load', init
$(document).ready init
