class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.references :user,         foreign_key: true
      t.references :app_post,     foreign_key: true
      t.text :comment,            null: false
      t.timestamps
    end
  end
end
