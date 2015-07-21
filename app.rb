# UserFirm Model
class UserFirm < ActiveRecord::Base
  has_many :users
  accepts_nested_attributes_for :users
end

# User Model
class User < ActiveRecord::Base
  belongs_to :user_firm
end

# Schema
ActiveRecord::Schema.define do
  create_table "", force: :cascade do |t|
    
  end
end

# user_firms controller
class UserFirmsController < ApplicationController
  
end

# users controller
class UsersController < ApplicationController
  
end

# Routes
Rails.application.routes.draw do
  
end
