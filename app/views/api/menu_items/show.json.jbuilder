Jbuilder.new do
  json.(
    @item,
    :id,
    :name,
    :description,
    :price
  )
end
