require_relative '../../config/application.rb'

class User < ActiveRecord::Base
  has_many :surveys

  def check_user(name)
    current_user = User.find_by_name(name)
    return current_user if current_user
  end


end