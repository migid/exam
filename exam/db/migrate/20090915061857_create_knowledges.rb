class CreateKnowledges < ActiveRecord::Migration
  def self.up
    create_table :knowledges do |t|
      t.string :name
      t.string :remark
      t.integer :subject_id

      t.timestamps
    end
  end

  def self.down
    drop_table :knowledges
  end
end
