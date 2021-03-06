class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:session][:email])
    begin
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        puts "login successfull!"
        redirect_to :achievements_all
      else
        raise "login failed!"
      end
    rescue RuntimeError => error_login
      puts "#{error_login}"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
