class ApplicationController < ActionController::Base
  def index
    render json: "Hello"
  end
end
