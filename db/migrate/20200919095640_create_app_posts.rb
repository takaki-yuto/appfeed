class CreateAppPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :app_posts do |t|
      t.string :name,               null: false
      t.string :dev_environment,    null: false
      t.string :using_language,     null: false
      t.text :using_lib_fram
      t.text :using_other
      t.text :detail,               null: false
      t.text :background
      t.string :dev_period
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
