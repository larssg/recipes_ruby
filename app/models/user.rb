class User < ActiveRecord::Base
  include Clearance::App::Models::User

  has_many :recipes
end
