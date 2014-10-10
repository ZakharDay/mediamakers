class CreateLandings < ActiveRecord::Migration
  def change
    create_table :landings do |t|
      t.string :index

      t.timestamps
    end
  end
end
