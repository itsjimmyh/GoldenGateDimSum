Jbuilder.new do
  json.(
    @user,
    :id,
    :first_name,
    :last_name,
    :email
  )
end
