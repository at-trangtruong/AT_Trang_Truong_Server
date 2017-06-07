class User::LoginSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :auth_token

  def fullname
    object.first_name + " " + object.last_name
  end
end
