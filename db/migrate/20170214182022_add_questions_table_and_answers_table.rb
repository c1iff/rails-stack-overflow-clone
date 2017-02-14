class AddQuestionsTableAndAnswersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :content
      t.string :user_id
      t.integer :rating

      t.timestamps
    end
    create_table :answers do |t|
      t.string :content
      t.string :question_id
      t.string :user_id
      t.integer :rating

      t.timestamps
    end
  end
end
