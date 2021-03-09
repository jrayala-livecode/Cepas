class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.references :enologist, foreign_key: true
      t.references :magazine, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
