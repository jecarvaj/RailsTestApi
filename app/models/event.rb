class Event < ApplicationRecord
   self.primary_key = 'id'
  belongs_to :actor
  belongs_to :repo
end
