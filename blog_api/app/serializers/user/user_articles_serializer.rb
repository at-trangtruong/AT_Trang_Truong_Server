class User::UserArticlesSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :avatar

  def fullname
    object.first_name + " " + object.last_name
  end
end
