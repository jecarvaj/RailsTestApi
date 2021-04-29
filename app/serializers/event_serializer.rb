class EventSerializer < ActiveModel::Serializer
  belongs_to :actor
  belongs_to :repo
  attributes :id, :type, :created_at, :actor, :repo
end
