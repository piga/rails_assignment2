class CreateKorisniks < ActiveRecord::Migration[6.1]
  def change
    create_table :korisniks do |t|
      t.string :email, null: false
      t.string :lozinka
      t.string :ime_i_prezime

      t.timestamps
    end
  end
end
