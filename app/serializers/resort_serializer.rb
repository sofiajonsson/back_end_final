class ResortSerializer < ActiveModel::Serializer
  has_many :favorites
  has_many :users, through: :favorites
  
  attributes :id, :title, :img, :elevation_gain, :skiiable_terrain, :beginner, :intermediate, :expert, :total_lifts, :ticket_price
end
