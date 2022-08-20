class UsersController < ApplicationController

    skip_before_action :authorized, except: [:auto_login]

    def index
        user = User.all
        render json: user
    end

    def create 
        user = User.create(user_params)
        if user.valid?
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, token: token}, status: :created
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def login
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, token: token}
        else
            render json: {error: "Invalid username or password"}
        end
    end

    def auto_login
        render json: current_user
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end