class AddReview < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :body
      t.string :title
      t.references :reviewable, polymorphic: true 
      t.belongs_to :user
    end
  end
end
