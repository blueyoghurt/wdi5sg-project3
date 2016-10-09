class BizownersController < ApplicationController

  def new
    @bizowner = Bizowner.new
  end

end
