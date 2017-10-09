class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :city
      t.integer :win_count

      t.timestamps null: false
    end
  end
end
