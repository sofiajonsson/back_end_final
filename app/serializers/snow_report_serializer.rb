class SnowReportSerializer < ActiveModel::Serializer
  has_many :favorites
  has_many :users, through: :favorites

  attributes :id, :title, :elevation, :status, :depth, :slopes, :lifts, :link
end
