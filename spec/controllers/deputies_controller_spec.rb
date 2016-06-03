require 'spec_helper'


describe DeputiesController do

  describe 'GET #new' do

    it "assigns a new Deputy to @Deputy" do
      get :new
      expect(assigns(:deputy)).to be_a_new(Deputy)
    end
  end

#show aqui
  describe 'GET #show' do
    it "should be in json format" do
      deputy_example = create(:deputy)
      get 'show', :id => deputy_example, format: :json
      hash = JSON.parse(deputy_example.to_json)
      hash.delete("created_at")
      hash.delete("updated_at")
      deputy_json = hash.to_json
      expect(response.body).to have_content deputy_json
    end
    it "assigns the requested deputy to @deputy" do
      deputy_example = create(:deputy)
      get 'show', :id => deputy_example.id
      expect(assigns(:deputy)).to eq deputy_example
    end
  end

  describe 'POST #create' do
    context "With valid attributes" do
      it "saves the new deputy in the database" do
        expect {
          post 'create', deputy: attributes_for(:deputy)
        }.to change(Deputy, :count).by(1)
      end
    end

    context "With invalid attributes" do

      it "does not save the deputy in the database" do
        expect{
          post 'create', deputy: attributes_for(:deputy, deputy_name: nil)
        }.to_not change(Deputy, :count)
      end

    end

  end

  describe 'DELETE #delete' do
    it "delete an user with a given id" do
      deputy_example = create(:deputy)
      expect{
        delete 'delete', :id => deputy_example.id
      }.to change(Deputy, :count).by(-1)
    end
  end

    describe 'PATCH #update' do
      context "valid attributes" do
        before :each do
          @deputy = create(:deputy, deputy_name: "Nome")
        end

        it "changes @deputy's atrributes" do
          patch 'update', id:@deputy, deputy: attributes_for(:deputy, name: "Mudando")
          @deputy.reload
          expect(@deputy.name).to eq("Mudando")
        end
      end
    end

end
