class AddStrspremaToPrijave < ActiveRecord::Migration[6.1]
  def change
    add_column :prijavas, :str_sprema, :string
  end
end
