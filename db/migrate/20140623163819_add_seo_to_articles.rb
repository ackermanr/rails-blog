class AddSeoToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :seo_title, :string
    add_column :articles, :seo_keys, :string
    add_column :articles, :seo_desc, :string
  end
end
