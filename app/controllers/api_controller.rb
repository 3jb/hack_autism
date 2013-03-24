class ApiController < ApplicationController
  def map
  end
  
  def quest
    @state = State.find params[:id]
    render json: @state
  end
end
