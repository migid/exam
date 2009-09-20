class CreateDifficulties < ActiveRecord::Migration
  def self.up
    create_table :difficulties do |t|
      t.string :name
      t.decimal :point, :precision=>8, :scale=>1
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :difficulties
  end
end
