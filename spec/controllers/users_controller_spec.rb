require 'spec_helper'

describe UsersController do

  before :each do
    @uf = create(:uf)
    @deputy = create(:deputy)
    @user = create(:user)
    @level = create(:level)
  end

  describe "GET #all" do
    it "returns all users json"
  end

  describe 'GET #new' do
    it "assigns a new User to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'GET #show' do
    it "assigns the requested user to @user" do
      get 'show', :id => @user.id
      expect(assigns(:user)).to eq @user
    end
  end

  describe 'POST #create' do
    context "With valid attributes" do
      it "saves the new user in the database" do
        expect {
          post 'create', user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end
    end
    context "With invalid attributes" do
      it "does not save the deputy in the database" do
        expect{
          post 'create', user: attributes_for(:user, nickname: nil)
        }.to_not change(User, :count)
      end
    end
  end

  describe 'DELETE #delete' do
    it "delete an user with a given id" do
      user_example = create(:user)
      expect{
        delete 'delete', :id => user_example.id
      }.to change(User, :count).by(-1)
    end
  end

  describe 'PATCH #update' do
    context "valid attributes" do
      it "changes @user's atrributes" do
        patch 'update', id:@user, user: attributes_for(:user, nickname: "Mudando")
        @user.reload
        expect(@user.nickname).to eq("Mudando")
      end
    end
    context "invalid attributes" do
      it "does not change @user attributes" do
        @user = create(:user, name: "Nome")
        patch 'update', id:@user, user: attributes_for(:user, nickname: nil)
        @user.reload
        expect(@user.name).to eq("Nome")
      end
    end
  end

  describe 'GET #follow_deputy' do
    it "follows a deputy" do
      @user.follow(@deputy)
      expect(@user.following?(@deputy)).to eq true
      expect(@deputy.followers_count).to eq 2

    end

  end

  describe 'GET #unfollow_deputy' do
    it "unfollows a deputy" do
      @user.follow(@deputy)
      expect(@user.following?(@deputy)).to eq true
      expect(@deputy.followers_count).to eq 2
      @user.unfollow(@deputy)
      expect(@user.following?(@deputy)).to eq false
      expect(@deputy.followers_count).to eq 1
    end
  end

  describe 'GET #followers' do
    it "shows the followers of a deputy"
  end

  describe 'GET #ionic_login' do
    it "does a login"
  end


end