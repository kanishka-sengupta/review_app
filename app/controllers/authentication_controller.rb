class AuthenticationController < ApplicationController
    skip_before_action :verify_authenticity_token

    def login
        @user=User.find_by_email(params[:email])
        if !@user
            return render json: { error: "Not found" }, status:  :not_found
        end
        if @user&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @user.id)
            time=Time.now + 2.hours.to_i
            render json: {
                token: token, 
                exp: time.strftime("%d-%m-%Y %H:%M"),
                username: @user.name}, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized 
        end

    end

    private

    def user_params
        params.permit(:email,:password)
    end
end