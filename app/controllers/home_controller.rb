class HomeController < ApplicationController

	def index
		responses = Response.all
		states = State.all

		@initn = params[:n]
		@newsay = params[:l]

		if @initn.blank?
			@state = State.first
		else
			@state = State.find(@initn)
		end
		@choices = Response.where(:current_state=>@state.id)

		if @newsay.blank?
			@talk = @state.toonsay
		else
			@talk = Response.where(:current_state=>@newsay,:next_state=>@initn).first.next_say
		end

		# @tomsays1 = []
		# @usersays1 = []
		# states.each_with_index do |x,i|
		# 	@tomsays1 << x.toonsay if i < 3
		# end
		# responses.each_with_index do |x,i|
		# 	@usersays1 << x.sayit if i < 10
		# end

		# @convo1 = {:name=>"Tom",:speech=>@tomsays1[0],:choices=>@usersays1[0..3]}

		# @convo2 = {:choice2=>@tomsays1[1]}

		# @convo3 = {:choice3=>@tomsays1[2]}

		# @amysays2 = []
		# @usersays2 = []
		# states.each_with_index do |x,i|
		# 	@amysays2 << x.toonsay if (i >= 3) && (i < 7)
		# end
		# responses.each_with_index do |x,i|
		# 	@usersays2 << x.sayit if (i >= 10) && (i < 16)
		# end

		# @tomsays3 = []
		# @usersays3 = []
		# states.each_with_index do |x,i|
		# 	@tomsays3 << x.toonsay if i >= 7
		# end
		# responses.each_with_index do |x,i|
		# 	@usersays3 << x.sayit if i >= 16
		# end



	end

end
