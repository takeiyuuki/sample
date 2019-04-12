class AddColumnsToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :email, :string
    add_column :contacts, :content, :text
  end
end
