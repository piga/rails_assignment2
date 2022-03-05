class SessionsController < ApplicationController
  def new

  end
  
  def create
    user = User.find_by_email(params[:email])
    #begin
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, notice: "Prijavili ste se!"
      else
        flash.now.alert = "Unijeli ste pogrešan email ili lozinku."
        render "new"
      end
    #rescue BCrypt::Errors::InvalidHash
      #puts "da da"
    #end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Odjavili ste se!"
  end
end
