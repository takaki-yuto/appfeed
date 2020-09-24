class UsersController < ApplicationController

  def index
    @apps = AppPost.all.order(id: "DESC")
  end

end
