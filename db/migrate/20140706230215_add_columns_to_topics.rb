class AddColumnsToTopics < ActiveRecord::Migration
  def change
  	    add_column :topics, :user, :string
  end
end
