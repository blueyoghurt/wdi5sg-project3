class JobseekersController < ApplicationController

  def new
    @jobseeker = Jobseeker.new
  end

end
