class UsersController < ApplicationController

  def index
    @users = User.where.not(username: "objo")
  end

end
