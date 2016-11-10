class PublicController < ApplicationController
  before_action :is_authenticated
  def index
    @application = Application.where(status: "Accepted")
  end
end
