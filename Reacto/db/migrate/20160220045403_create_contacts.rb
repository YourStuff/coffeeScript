class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.boolean :done
    end
  end
end
