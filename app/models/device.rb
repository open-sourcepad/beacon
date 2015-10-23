class Device < ActiveRecord::Base
  UNSAFE_STATES = %w(default fire flood accidents calamity crime)

  validates_presence_of :device_id, :latitude, :longitude
  validates_uniqueness_of :device_id


  #===================
  #      SCOPES
  #===================
  def aids_received
    @_aids_received = Aid.where(recipient_id: device_id)
  end

  def aids_given
    @_aids_given = Aid.where(criminal_id: device_id)
  end


  #===================
  #     CALLBACKS
  #===================
  def update_aids_accordingly
    if UNSAFE_STATES.include?(state_was) && !UNSAFE_STATES.include?(state)
      aids_received.update_all(state: 'inactive')
    end
  end
  before_update :update_aids_accordingly

end
