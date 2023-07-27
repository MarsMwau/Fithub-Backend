class UserSerializer < ActiveModel::Serializer
  attributes :username,:email,:password_digest,:age,:gender,:height,:initial_weight,:target_weight
end
