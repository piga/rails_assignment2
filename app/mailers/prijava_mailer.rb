class PrijavaMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.prijava_mailer.nova.subject
  #
  
  default from: 'zadatak@ingemark.com'
  
  def nova
    
    @oglas = params[:oglas]
    @prijava = params[:prijava]

    mail to: [@oglas.email, @prijava.email], subject: "Uspješna prijava na posao"
  end
end
