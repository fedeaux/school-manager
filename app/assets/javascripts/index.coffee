@DateFormats =
  db_day: 'YYYY-MM-DD'
  pretty_day: 'ddd, MMM Do'
  hour_and_minute: 'HH:mm'

window.config =
  api_url: '/'

angular.module('SchoolManagerApp', ['ngResource', 'ngMessages', 'ui.router' ])

init = ->
  angular.bootstrap( $('body'), ['SchoolManagerApp'] )

$(document).on 'page:load', init
$(document).ready init
