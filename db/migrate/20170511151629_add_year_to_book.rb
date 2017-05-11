class AddYearToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :year, :string
  end
end
