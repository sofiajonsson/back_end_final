class UserSerializer < ActiveModel::Serializer
  # has_many :reviews
	# has_many :favorites
  #
	# has_many :snow_reports, through: :favorites
	# has_many :weekly_forecasts, through: :favorites
	# has_many :resorts, through: :favorites
  #
 attributes :id, :name, :email, :password_digest, :home_country
end
