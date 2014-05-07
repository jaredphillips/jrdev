class AddTwitterInfoToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :twitter_info, :string
  end
end
