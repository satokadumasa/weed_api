class Auth::RegistrationsController < ApplicationController

    def signup
        pp registrations_params
        @user = User.new(registrations_params)
        user_role = UserRole.new(role_id: registrations_params[:role_id])
        @user.user_role = user_role

        if @user.save
            # login!
            render json: { status: :created, user: @user }
        else
            render json: { status: 500 }
        end
    end

    private
        def registrations_params
            params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :role_id)
        end
end