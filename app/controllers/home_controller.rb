class HomeController < ApplicationController

	def index
		responses = Response.all
		states = State.all

		@talk_value = params[:state]
		@newsay = params[:response]

		@talk_value.blank? ? @state = State.find_by_s_id(1) : @state = State.find_by_s_id(@talk_value)
		@choices = Response.where(:current_state=>@state.s_id)

		@newsay.blank? ? @talk = @state.toonsay : @talk = Response.where(:current_state=>@newsay,:next_state=>@talk_value).first.next_say

# # params
# 		render :json => @talk_value
# 		render :json => @newsay

# # values for State (state) and Response (talk is NPC output, choices belong to User)
# 		render :json => @talk
# 		render :json => @state
# 		render :json => @choices

	end

end
