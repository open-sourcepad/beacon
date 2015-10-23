class Device < ActiveRecord::Base
  validates_presence_of :device_id, :latitude, :longitude
  validates_uniqueness_of :device_id

  def aids_received
    @_aids_received = Aid.where(recipient_id: device_id)
  end

  def aids_given
    @_aids_given = Aid.where(criminal_id: device_id)
  end
end
