class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :favorites, array: true, default: []

      t.timestamps null: false
    end
  end
end
