class LeaseSerializer < ActiveModel::Serializer
  attributes :id, :rent, :apartment_id, :tenant_id
end
