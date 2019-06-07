class ResortsController < ApplicationController
	def index
		@resorts = Resort.all
	end

end
