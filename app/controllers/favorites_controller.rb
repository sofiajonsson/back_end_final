class FavoritesController < ApplicationController
	def index
		@favorites = Favorite.all
		render json: @favorites
	end

	def create

	end

	def update

	end

	def destroy

	end
end
