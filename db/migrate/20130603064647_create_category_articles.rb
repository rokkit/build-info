class CreateCategoryArticles < ActiveRecord::Migration
  def change
    create_table :category_articles do |t|
      t.string :name

      t.timestamps
    end
  end
end
