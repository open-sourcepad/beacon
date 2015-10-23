json.extract! obj, *%i(
  device_id
  state
  latitude
  longitude
  created_at
  updated_at
)

json.helping obj.aids_given.pluck(:recipient_id)
json.helped_by obj.aids_received.pluck(:criminal_id)
