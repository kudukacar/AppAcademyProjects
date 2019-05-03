class UsersController < ApplicationController

    def new
        render :new
        # ^ implicit!! < explicit
        # ^ redundant
    end

    def index
        render :index
    end 

    def create
        @user = User.new (user_params)
        if @user.save
            session[:session_token] = @user.reset_session_token!
            redirect_to users_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])
        if @user.destroy 
            redirect_to users_url 
        else
            flash.now[:errors] = @user.errors.full_messages
            render :index
        end
    end
    
    private
        def user_params
            params.require(:user).permit(:username, :password)
        end

end