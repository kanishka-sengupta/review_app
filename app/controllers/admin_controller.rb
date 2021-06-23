class AdminController < ApplicationController
    skip_before_action :verify_authenticity_token

    require 'rails/generators'
    def create_entity
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
    end


end