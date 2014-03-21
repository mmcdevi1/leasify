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

describe AmenitiesController do

  # This should return the minimal set of attributes required to create a valid
  # Amenity. As you add validations to Amenity, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AmenitiesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all amenities as @amenities" do
      amenity = Amenity.create! valid_attributes
      get :index, {}, valid_session
      assigns(:amenities).should eq([amenity])
    end
  end

  describe "GET show" do
    it "assigns the requested amenity as @amenity" do
      amenity = Amenity.create! valid_attributes
      get :show, {:id => amenity.to_param}, valid_session
      assigns(:amenity).should eq(amenity)
    end
  end

  describe "GET new" do
    it "assigns a new amenity as @amenity" do
      get :new, {}, valid_session
      assigns(:amenity).should be_a_new(Amenity)
    end
  end

  describe "GET edit" do
    it "assigns the requested amenity as @amenity" do
      amenity = Amenity.create! valid_attributes
      get :edit, {:id => amenity.to_param}, valid_session
      assigns(:amenity).should eq(amenity)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Amenity" do
        expect {
          post :create, {:amenity => valid_attributes}, valid_session
        }.to change(Amenity, :count).by(1)
      end

      it "assigns a newly created amenity as @amenity" do
        post :create, {:amenity => valid_attributes}, valid_session
        assigns(:amenity).should be_a(Amenity)
        assigns(:amenity).should be_persisted
      end

      it "redirects to the created amenity" do
        post :create, {:amenity => valid_attributes}, valid_session
        response.should redirect_to(Amenity.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved amenity as @amenity" do
        # Trigger the behavior that occurs when invalid params are submitted
        Amenity.any_instance.stub(:save).and_return(false)
        post :create, {:amenity => { "name" => "invalid value" }}, valid_session
        assigns(:amenity).should be_a_new(Amenity)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Amenity.any_instance.stub(:save).and_return(false)
        post :create, {:amenity => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested amenity" do
        amenity = Amenity.create! valid_attributes
        # Assuming there are no other amenities in the database, this
        # specifies that the Amenity created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Amenity.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => amenity.to_param, :amenity => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested amenity as @amenity" do
        amenity = Amenity.create! valid_attributes
        put :update, {:id => amenity.to_param, :amenity => valid_attributes}, valid_session
        assigns(:amenity).should eq(amenity)
      end

      it "redirects to the amenity" do
        amenity = Amenity.create! valid_attributes
        put :update, {:id => amenity.to_param, :amenity => valid_attributes}, valid_session
        response.should redirect_to(amenity)
      end
    end

    describe "with invalid params" do
      it "assigns the amenity as @amenity" do
        amenity = Amenity.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Amenity.any_instance.stub(:save).and_return(false)
        put :update, {:id => amenity.to_param, :amenity => { "name" => "invalid value" }}, valid_session
        assigns(:amenity).should eq(amenity)
      end

      it "re-renders the 'edit' template" do
        amenity = Amenity.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Amenity.any_instance.stub(:save).and_return(false)
        put :update, {:id => amenity.to_param, :amenity => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested amenity" do
      amenity = Amenity.create! valid_attributes
      expect {
        delete :destroy, {:id => amenity.to_param}, valid_session
      }.to change(Amenity, :count).by(-1)
    end

    it "redirects to the amenities list" do
      amenity = Amenity.create! valid_attributes
      delete :destroy, {:id => amenity.to_param}, valid_session
      response.should redirect_to(amenities_url)
    end
  end

end