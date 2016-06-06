class UsersController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  def all
    render json: User.all
  end

  def show
    id_user = params[:id]
        users = User.where(id: id_user)
        user = nil
        if (users.length > 0)
          user = users.first
        else
          raise "ERROR: No user to be shown"
        end
          render json: user
  end

  def new
  end

  def create
    #puts get_params
    user = User.new(get_params)
    puts user
    saved = user.save
    begin
      if saved
        session[:user_id] = user.id
        render json: user
      else
        raise "sign up failed"
      end
    rescue RuntimeError => error_signup
      puts "#{error_signup}"
    end

    #render json: User.new
  end

  def edit
    id_users = params[:id]
    user = nil
    users = User.where(id: id_users)
      @user = users.first
      render :edit
  end

  def update
    user_id = params[:id]
    puts "#{params[:user]}"
    user = User.find_by(id: user_id)
    begin
      if user
        user.update(get_params)
        render json: user
      else
        raise "user edit failed"
      end
    rescue RuntimeError => error_edit
      puts "#{error_edit}"
    end
  end

  def delete
    user_id = params[:id]
    user = User.find_by(id: user_id)
    puts "#{user}"


      if user
        user.delete
        render json: user
      end
  end

  def followers
    deputy_id = params[:id]
    deputy = Deputy.find_by(id: deputy_id)
    deputy_followers = deputy.followers.count
    render json: deputy_followers
  end

  def follow_deputy
    deputy_id = params[:deputyId]
    user_id = params[:userId]
    user = User.find_by(id: user_id)
    deputy = Deputy.find_by(id: deputy_id)
    user.follow(deputy)
    render :nothing => true
  end

  def unfollow_deputy
    deputy_id = params[:deputyId]
    user_id = params[:userId]
    user = User.find_by(id: user_id)
    deputy = Deputy.find_by(id: deputy_id)
    user.unfollow(deputy)
    render :nothing => true
  end

  def ionic_login
    user = User.find_by(email: params[:email])
    begin
      if user && user.authenticate(params[:password])
        puts "login successfull!"
        puts user
        render json: user
      else
        raise "login failed!"
      end
    rescue RuntimeError => error_login
      puts "#{error_login}"
      redirect_to 'login'
    end
  end

  private
    def get_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
