# UserFirm Model
class UserFirm < ActiveRecord::Base
  has_many :users
  accepts_nested_attributes_for :users, 
                                :reject_if => proc { |attribute| attribute[:name].blank? }
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
    @user_firms = UserFirm.all
  end
  
  def show
    @user_firm = UserFirm.find(params[:id])
  end
  
  def new
    @user_firm = UserFirm.new(user_firm_params)
    question   = @user_firm.users.build
  end
  
  def create
    @user_firm = UserFirm.new(user_firm_params)
    @user_firm.save
  end
  
  private
    def user_firm_params
      params.require(:user_firm).permit(:name, :user_attributes => [:name])
    end
end

# users controller
class UsersController < ApplicationController
  def index
    @user_firm = UserFirm.find(params[:user_firm_id])
    @users     = @user_firm.users.all
  end
  
  def show
    @user_firm = UserFirm.find(params[:user_firm_id])
    @user      = @user_firm.users.find(params[:id])
  end
  
  def new
    @user_firm = UserFirm.find(params[:user_firm_id])
    @user      = @user_firm.users.build
  end
  
  def create
    @user_firm = UserFirm.find(params[:user_firm_id])
    @user      = @user_firm.users.build(user_params)
    @user.save
  end
  
  private
    def user_params
      params.require(:user).permit(:name)
    end
end
  
# Routes
Rails.application.routes.draw do
  get  'user_firm/index'    
  get  'user_firm/show'
  get  'user_firm/new'
  post 'user_firm/create'
  get  'user/index'
  get  'user/show'
  get  'user/new'
  post 'user/create'
  
  resources :user_firms
  resources :user_firms do
    resources :users
  end 
end
