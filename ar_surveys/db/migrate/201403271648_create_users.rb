require_relative '../../config/application'
#validation for unique name
#validation for password length
# this is where you should use an ActiveRecord migration to

class CreateUsers < ActiveRecord::Migration

  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :users do |t|
      t.string :name
      t.string :password

      t.timestamps #this automatically adds created_at and updated_at
    end
  end

end