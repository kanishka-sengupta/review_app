class EntityGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  argument :fields, type: :array

  def create_model
    model_name_and_fields=fields.unshift(class_name)
    invoke 'active_record:model' , model_name_and_fields
    if File::exists?("app/models/#{file_name}.rb")
      inject_into_file "app/models/#{file_name}.rb", after: "class #{class_name} < ApplicationRecord\n" do 
        "\thas_many :reviews,as: :reviewable\n"
      end
    end
  end

  def create_controller
    template "entities_controller.erb","app/controllers/#{file_name.pluralize}_controller.rb"
  end


  def add_routes
    route "resources :#{file_name.pluralize}, only: [:index,:show,:create,:update]"
  end

  # def run_migration
  #   rake "db:migrate"
  # end

end
