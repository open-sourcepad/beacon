class Device < ActiveRecord::Base
  validates_presence_of :device_id, :latitude, :longitude
end
