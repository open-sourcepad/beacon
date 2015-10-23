class Aid < ActiveRecord::Base
  validates_presence_of :criminal_id, :recipient_id
end
