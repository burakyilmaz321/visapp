class User < ActiveRecord::Base
  has_one :firm
  accepts_nested_attributes_for :firm
end
