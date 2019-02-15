class AddFrameToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :Frame, :text
    add_column :articles, :Wheel, :text
    add_column :articles, :FD, :text
    add_column :articles, :RD, :text
    add_column :articles, :Crank_Set, :text
    add_column :articles, :Brake, :text
    add_column :articles, :Handle, :text
    add_column :articles, :Stem, :text
  end
end
