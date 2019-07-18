class UsersController < ApplicationController
	def index
		@users = User.all
		render json: @users
	end

	def create
		@event = Event.create(event_params)
		render json: @event
	end

	def update
		@event.update(event_params)
			if @event.save
				render json: @event, status: :accepted
			else
				render json: { errors: @event.errors.full_messages }, status: :unprocessible_entity
			end
	end

	def destroy

	end
end
