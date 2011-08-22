class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :answer
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
