json.data do
  json.array! @objs, partial: 'obj', as: :obj
end
