class ChangeArticle < ActiveRecord::Migration[5.0]
  def change
  	change_column :articles, :detail, :text
  	remove_column :articles, :description
  end
end
