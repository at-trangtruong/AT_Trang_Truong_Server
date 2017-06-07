class User::ShowSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :fullname, :picture, :birthday, :sex, :followed
  
  has_many :articles

  def fullname
    object.first_name + " " + object.last_name
  end

  def followed
    @instance_options[:followed]
  end
end
