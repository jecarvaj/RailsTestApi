class Actor < ApplicationRecord
  self.primary_key = 'id'
  has_many :events
end
