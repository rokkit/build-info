class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :content
      t.references :user
      t.boolean :published
      t.references :category_article

      t.timestamps
    end
    add_index :articles, :user_id
    add_index :articles, :category_article_id
  end
end
