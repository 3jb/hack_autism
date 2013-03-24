class HomeController < ApplicationController

	def index
		# responses = Response.all
		# states = State.all

		# @talk_value = params[:state]
		# @newsay = params[:response]

		# @talk_value.blank? ? @state = State.find_by_s_id(1) : @state = State.find_by_s_id(@talk_value)
		# @choices = Response.where(:current_state=>@state.s_id)

		# @newsay.blank? ? @talk = @state.toonsay : @talk = Response.where(:current_state=>@newsay,:next_state=>@talk_value).first.next_say

		@ws = GoogleSpreadsheet.quest_1

    steps = {}

    for row in 6..@ws.num_rows
    	step_id = @ws[row,1]
    	
    	step = (steps[step_id] ||= {})
    	step[:options] ||= []

      agentText = @ws[row,2] if !@ws[row,2].blank?


      step[:agentText] = agentText if agentText
      step[:options] << {
      	text: @ws[row,3],
      	response_quality: @ws[row,4],
      	nextStep: @ws[row,5],
      	oracleText: @ws[row,6]
      }

      
    end

    ap steps
  end
end