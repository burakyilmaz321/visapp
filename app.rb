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
  create_table "user_firms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  
    create_table "users", force: :cascade do |t|
    t.integer  "user_firm_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end

# user_firms controller
class UserFirmsController < ApplicationController
  def index
  end
  
  def show
  end
  
  def new
  end
  
  def create
  end
  
  private
    def user_firm_params
    end
end

# users controller
class UsersController < ApplicationController
  def index
  end
  
  def show
  end
  
  def new
  end
  
  def create
  end
end

# Routes
Rails.application.routes.draw do
  
end
