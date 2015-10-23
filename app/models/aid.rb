class Aid < ActiveRecord::Base
  ACTIVE = 'active'

  validates_presence_of :criminal_id, :recipient_id

  scope :active, ->{ where(state: ACTIVE)}
end
