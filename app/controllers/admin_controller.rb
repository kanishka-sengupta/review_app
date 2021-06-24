class AdminController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorize_request

    require 'rails/generators'
    def create_entity
        if is_admin?
            variables=params[:admin]
            creationString='';
            variables.each do |name,value|
                if name == "className"
                    next
                else
                    creationString+=name+":"+value+" "
                end
            end
            #Rails::Generators.invoke("entity",creationString)
            system "rails g entity #{variables[:className]} #{creationString}"
            render json: params
        else
            render json: {error: "Not Authorized"} ,status: :unauthorized
        end
    end


end