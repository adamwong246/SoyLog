class AddDescrptions < ActiveRecord::Migration
  def change
    add_column :recipes,    :description, :text
    add_column :nutrients,  :description, :text
    add_column :components, :note,        :text
    add_column :users,      :about,       :text

  end
end
