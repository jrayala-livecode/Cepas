class CreateEnologists < ActiveRecord::Migration[5.2]
  def change
    create_table :enologists do |t|
      t.string :name
      t.string :age
      t.string :nationality
      t.string :work_place

      t.timestamps
    end
  end
end
