# Preview all emails at http://localhost:3000/rails/mailers/prijava
class PrijavaPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/prijava/nova
  def nova
    PrijavaMailer.nova
  end

end
