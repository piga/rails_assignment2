class AddImeIPrezimeInUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :ime_i_prezime, :string
  end
end
