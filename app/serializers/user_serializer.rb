class UserSerializer < ActiveModel::Serializer
  attributes data = :id, :firstname, :lastname, :email 
end
