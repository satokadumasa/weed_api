class UserController < ApplicationController
  before_action :authenticate_user!
  def me
    pp "UserController.me"
    @user = current_user
  end
end
