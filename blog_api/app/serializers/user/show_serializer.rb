class User::ShowSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :avatar
  has_many :articles

  def fullname
    object.first_name + " " + object.last_name
  end
end
