require 'spec_helper'

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

describe SpatialsController do

  # This should return the minimal set of attributes required to create a valid
  # Spatial. As you add validations to Spatial, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "shap1" => "MyText" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SpatialsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all spatials as @spatials" do
      spatial = Spatial.create! valid_attributes
      get :index, {}, valid_session
      assigns(:spatials).should eq([spatial])
    end
  end

  describe "GET show" do
    it "assigns the requested spatial as @spatial" do
      spatial = Spatial.create! valid_attributes
      get :show, {:id => spatial.to_param}, valid_session
      assigns(:spatial).should eq(spatial)
    end
  end

  describe "GET new" do
    it "assigns a new spatial as @spatial" do
      get :new, {}, valid_session
      assigns(:spatial).should be_a_new(Spatial)
    end
  end

  describe "GET edit" do
    it "assigns the requested spatial as @spatial" do
      spatial = Spatial.create! valid_attributes
      get :edit, {:id => spatial.to_param}, valid_session
      assigns(:spatial).should eq(spatial)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Spatial" do
        expect {
          post :create, {:spatial => valid_attributes}, valid_session
        }.to change(Spatial, :count).by(1)
      end

      it "assigns a newly created spatial as @spatial" do
        post :create, {:spatial => valid_attributes}, valid_session
        assigns(:spatial).should be_a(Spatial)
        assigns(:spatial).should be_persisted
      end

      it "redirects to the created spatial" do
        post :create, {:spatial => valid_attributes}, valid_session
        response.should redirect_to(Spatial.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved spatial as @spatial" do
        # Trigger the behavior that occurs when invalid params are submitted
        Spatial.any_instance.stub(:save).and_return(false)
        post :create, {:spatial => { "shap1" => "invalid value" }}, valid_session
        assigns(:spatial).should be_a_new(Spatial)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Spatial.any_instance.stub(:save).and_return(false)
        post :create, {:spatial => { "shap1" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested spatial" do
        spatial = Spatial.create! valid_attributes
        # Assuming there are no other spatials in the database, this
        # specifies that the Spatial created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Spatial.any_instance.should_receive(:update).with({ "shap1" => "MyText" })
        put :update, {:id => spatial.to_param, :spatial => { "shap1" => "MyText" }}, valid_session
      end

      it "assigns the requested spatial as @spatial" do
        spatial = Spatial.create! valid_attributes
        put :update, {:id => spatial.to_param, :spatial => valid_attributes}, valid_session
        assigns(:spatial).should eq(spatial)
      end

      it "redirects to the spatial" do
        spatial = Spatial.create! valid_attributes
        put :update, {:id => spatial.to_param, :spatial => valid_attributes}, valid_session
        response.should redirect_to(spatial)
      end
    end

    describe "with invalid params" do
      it "assigns the spatial as @spatial" do
        spatial = Spatial.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Spatial.any_instance.stub(:save).and_return(false)
        put :update, {:id => spatial.to_param, :spatial => { "shap1" => "invalid value" }}, valid_session
        assigns(:spatial).should eq(spatial)
      end

      it "re-renders the 'edit' template" do
        spatial = Spatial.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Spatial.any_instance.stub(:save).and_return(false)
        put :update, {:id => spatial.to_param, :spatial => { "shap1" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested spatial" do
      spatial = Spatial.create! valid_attributes
      expect {
        delete :destroy, {:id => spatial.to_param}, valid_session
      }.to change(Spatial, :count).by(-1)
    end

    it "redirects to the spatials list" do
      spatial = Spatial.create! valid_attributes
      delete :destroy, {:id => spatial.to_param}, valid_session
      response.should redirect_to(spatials_url)
    end
  end

end
