class SessionsController < ApplicationController
  
  def create
    user = User.find_by_email(params[:email])
    #begin
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = "Prijavili ste se!" 
        redirect_to root_url
      else
        flash[:warning] = "Unijeli ste pogrešan email ili lozinku."
        redirect_to root_url
      end
    #rescue BCrypt::Errors::InvalidHash
      #puts "da da"
    #end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:info] = "Odjavili ste se!"
    redirect_to root_url
  end
end
