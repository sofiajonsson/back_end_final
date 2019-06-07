class ResortsController < ApplicationController
	def index
		@resorts = Resort.all
		puts "hi"
		render json: @resorts
	end

end
