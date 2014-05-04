class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :url
      t.boolean :promoted, default: false

      t.timestamps
    end
  end
end
