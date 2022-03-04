require "rails_helper"

RSpec.describe PrijavaMailer, type: :mailer do
  
  
  
  describe "nova" do
    cdccd
    
    let(:mail) { PrijavaMailer.with(prijava: @prijava, oglas: @oglas).nova }

    before(:context) do
      @oglas = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)

      @prijava = Prijava.create(ime_i_prezime: "Stella Maleš", dat_rodenja: Date.today, email: "fsfs@ffw.fd", telefon: "87295420", boraviste: "Zadar 56 ulica mora", str_sprema: "SSS", ogla_id: @oglas.to_param)
    end
    
    it "renders the headers" do
      expect(mail.subject).to eq("Uspješna prijava na posao")
      expect(mail.to).to eq(["neki9@domena.com", "fsfs@ffw.fd"])
      expect(mail.from).to eq(["zadatak@ingemark.com"])
    end

    it "prikazan je naslov" do
      expect(mail.body.encoded).to match("bravo")
    end
    
    it "ne mogu detektirati š u imenu i prezimenu prijave jer mi stalno encode radi UTF-8" do
      expect(mail.body.encoded).not_to match("Stella Maleš")
    end
    
    it "prikazan je datum" do
      expect(mail.body.encoded).to match(Date.today.to_s)
    end
    
    it "prikazan je email" do
      expect(mail.body.encoded).to match("fsfs@ffw.fd")
    end
    
    it "prikazan je telefon" do
      expect(mail.body.encoded).to match("87295420")
    end
    
    it "prikazano je boravište" do
      expect(mail.body.encoded).to match("Zadar 56 ulica mora")
    end
    
    it "prikazana je stručna sprema" do
      expect(mail.body.encoded).to match("SSS")
    end
    
  end

end
