# Preview all emails at http://localhost:3000/rails/mailers/prijava
class PrijavaPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/prijava/nova
  def nova
    oglas = Ogla.create(naziv: "Naziv tog oglasa", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", kategorija: "Bankarstvo", od: Date.today, do: Date.tomorrow)
    
    prijava = Prijava.create(ime_i_prezime: "Darko Vulin", dat_rodenja: Date.today, email: "fwioj@wef.j", telefon: "582092453", boraviste: "Zagreb ulica Slavojie 43", str_sprema: "SSS", ogla_id: oglas.to_param)
    
    PrijavaMailer.with(oglas: oglas, prijava: prijava).nova
  end

end
