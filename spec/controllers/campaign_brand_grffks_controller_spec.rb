require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe CampaignBrandGrffksController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # CampaignBrandGrffk. As you add validations to CampaignBrandGrffk, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CampaignBrandGrffksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all campaign_brand_grffks as @campaign_brand_grffks" do
      campaign_brand_grffk = CampaignBrandGrffk.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:campaign_brand_grffks)).to eq([campaign_brand_grffk])
    end
  end

  describe "GET show" do
    it "assigns the requested campaign_brand_grffk as @campaign_brand_grffk" do
      campaign_brand_grffk = CampaignBrandGrffk.create! valid_attributes
      get :show, {:id => campaign_brand_grffk.to_param}, valid_session
      expect(assigns(:campaign_brand_grffk)).to eq(campaign_brand_grffk)
    end
  end

  describe "GET new" do
    it "assigns a new campaign_brand_grffk as @campaign_brand_grffk" do
      get :new, {}, valid_session
      expect(assigns(:campaign_brand_grffk)).to be_a_new(CampaignBrandGrffk)
    end
  end

  describe "GET edit" do
    it "assigns the requested campaign_brand_grffk as @campaign_brand_grffk" do
      campaign_brand_grffk = CampaignBrandGrffk.create! valid_attributes
      get :edit, {:id => campaign_brand_grffk.to_param}, valid_session
      expect(assigns(:campaign_brand_grffk)).to eq(campaign_brand_grffk)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CampaignBrandGrffk" do
        expect {
          post :create, {:campaign_brand_grffk => valid_attributes}, valid_session
        }.to change(CampaignBrandGrffk, :count).by(1)
      end

      it "assigns a newly created campaign_brand_grffk as @campaign_brand_grffk" do
        post :create, {:campaign_brand_grffk => valid_attributes}, valid_session
        expect(assigns(:campaign_brand_grffk)).to be_a(CampaignBrandGrffk)
        expect(assigns(:campaign_brand_grffk)).to be_persisted
      end

      it "redirects to the created campaign_brand_grffk" do
        post :create, {:campaign_brand_grffk => valid_attributes}, valid_session
        expect(response).to redirect_to(CampaignBrandGrffk.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved campaign_brand_grffk as @campaign_brand_grffk" do
        post :create, {:campaign_brand_grffk => invalid_attributes}, valid_session
        expect(assigns(:campaign_brand_grffk)).to be_a_new(CampaignBrandGrffk)
      end

      it "re-renders the 'new' template" do
        post :create, {:campaign_brand_grffk => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested campaign_brand_grffk" do
        campaign_brand_grffk = CampaignBrandGrffk.create! valid_attributes
        put :update, {:id => campaign_brand_grffk.to_param, :campaign_brand_grffk => new_attributes}, valid_session
        campaign_brand_grffk.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested campaign_brand_grffk as @campaign_brand_grffk" do
        campaign_brand_grffk = CampaignBrandGrffk.create! valid_attributes
        put :update, {:id => campaign_brand_grffk.to_param, :campaign_brand_grffk => valid_attributes}, valid_session
        expect(assigns(:campaign_brand_grffk)).to eq(campaign_brand_grffk)
      end

      it "redirects to the campaign_brand_grffk" do
        campaign_brand_grffk = CampaignBrandGrffk.create! valid_attributes
        put :update, {:id => campaign_brand_grffk.to_param, :campaign_brand_grffk => valid_attributes}, valid_session
        expect(response).to redirect_to(campaign_brand_grffk)
      end
    end

    describe "with invalid params" do
      it "assigns the campaign_brand_grffk as @campaign_brand_grffk" do
        campaign_brand_grffk = CampaignBrandGrffk.create! valid_attributes
        put :update, {:id => campaign_brand_grffk.to_param, :campaign_brand_grffk => invalid_attributes}, valid_session
        expect(assigns(:campaign_brand_grffk)).to eq(campaign_brand_grffk)
      end

      it "re-renders the 'edit' template" do
        campaign_brand_grffk = CampaignBrandGrffk.create! valid_attributes
        put :update, {:id => campaign_brand_grffk.to_param, :campaign_brand_grffk => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested campaign_brand_grffk" do
      campaign_brand_grffk = CampaignBrandGrffk.create! valid_attributes
      expect {
        delete :destroy, {:id => campaign_brand_grffk.to_param}, valid_session
      }.to change(CampaignBrandGrffk, :count).by(-1)
    end

    it "redirects to the campaign_brand_grffks list" do
      campaign_brand_grffk = CampaignBrandGrffk.create! valid_attributes
      delete :destroy, {:id => campaign_brand_grffk.to_param}, valid_session
      expect(response).to redirect_to(campaign_brand_grffks_url)
    end
  end

end
