module Api
  class ApiBase < ApplicationController
    skip_before_action :verify_authenticity_token
  end
end
