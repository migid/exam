class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.text :content
      t.string :answer
      t.string :knowledges_id
      t.integer :difficulty_id
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
