json.data do
  json.array! @objs, partial: 'api/v1/devices/obj', as: :obj
end
