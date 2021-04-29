class Event < ApplicationRecord
   self.primary_key = 'id'
   self.inheritance_column = "_type"
  belongs_to :actor
  belongs_to :repo
end
