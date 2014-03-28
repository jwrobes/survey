require_relative '../../config/application'
#validation for unique name?
#validation for password length?
class CreateSurveys < ActiveRecord::Migration

  def change
    create_table :surveys do |t|
      t.string :aha
      t.integer :confidence
      t.belongs_to :user
      t.date :date
      t.timestamps #this automatically adds created_at and updated_at
    end
  end

end