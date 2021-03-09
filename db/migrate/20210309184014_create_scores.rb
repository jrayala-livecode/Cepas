class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.references :wine, foreign_key: true
      t.references :enologist, foreign_key: true
      t.float :score
      
      t.timestamps
    end
  end
end
