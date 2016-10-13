class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :name
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
