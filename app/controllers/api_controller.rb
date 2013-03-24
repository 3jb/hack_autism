class ApiController < ApplicationController
  def map
    
  end
  
  def quests
    if params[:id] == "1"
      @ws = GoogleSpreadsheet.worksheet("1:1-script")
    elsif params[:id] == "2"
      @ws = GoogleSpreadsheet.worksheet("2:1-script")
    end
    
    steps = {}

    for row in 6..@ws.num_rows
    	step_id = @ws[row,1].to_i
    	
    	step = (steps[step_id] ||= {})
    	step[:options] ||= []

      agentText = @ws[row,2] if !@ws[row,2].blank?

      step[:agentText] = agentText if agentText
      step[:options] << {
      	text: @ws[row,3],
      	response_quality: @ws[row,4].to_i,
      	nextStep: @ws[row,5].to_i,
      	oracleText: @ws[row,6]
      }
    end
    
    render json: {
      agent: {
        name: "Tom",
        agentId: 1
      },
      result: {
        1 => 5,
        2 => 4
      },
      step: steps
    }
  end
end