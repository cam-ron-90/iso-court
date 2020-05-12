json.array! @users do |user|
  json.extract! user, :id, :username
  if user.avatar.attached?
    json.avatar user.avatar.key
  else
    json.avatar nil
  end
end
