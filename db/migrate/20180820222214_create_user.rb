class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.string :username
      t.text   :bio

      t.timestamps
    end
  end
end
