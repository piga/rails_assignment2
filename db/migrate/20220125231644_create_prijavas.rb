class CreatePrijavas < ActiveRecord::Migration[6.1]
  def change
    create_table :prijavas do |t|
      t.string :ime_i_prezime
      t.date :dat_rodenja
      t.string :email
      t.string :telefon
      t.string :boraviste
      t.references :ogla, null: false, foreign_key: true

      t.timestamps
    end
  end
end
