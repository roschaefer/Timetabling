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

RSpec.describe EctsModulesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # EctsModule. As you add validations to EctsModule, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {:name => "I am a module"}
  }

  let(:invalid_attributes) {
    {:name => nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EctsModulesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all ects_modules as @ects_modules" do
      ects_module = EctsModule.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:ects_modules)).to eq([ects_module])
    end
  end

  describe "GET #show" do
    it "assigns the requested ects_module as @ects_module" do
      ects_module = EctsModule.create! valid_attributes
      get :show, {:id => ects_module.to_param}, valid_session
      expect(assigns(:ects_module)).to eq(ects_module)
    end
  end

  describe "GET #new" do
    it "assigns a new ects_module as @ects_module" do
      get :new, {}, valid_session
      expect(assigns(:ects_module)).to be_a_new(EctsModule)
    end
  end

  describe "GET #edit" do
    it "assigns the requested ects_module as @ects_module" do
      ects_module = EctsModule.create! valid_attributes
      get :edit, {:id => ects_module.to_param}, valid_session
      expect(assigns(:ects_module)).to eq(ects_module)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new EctsModule" do
        expect {
          post :create, {:ects_module => valid_attributes}, valid_session
        }.to change(EctsModule, :count).by(1)
      end

      it "assigns a newly created ects_module as @ects_module" do
        post :create, {:ects_module => valid_attributes}, valid_session
        expect(assigns(:ects_module)).to be_a(EctsModule)
        expect(assigns(:ects_module)).to be_persisted
      end

      it "redirects to the created ects_module" do
        post :create, {:ects_module => valid_attributes}, valid_session
        expect(response).to redirect_to(EctsModule.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved ects_module as @ects_module" do
        post :create, {:ects_module => invalid_attributes}, valid_session
        expect(assigns(:ects_module)).to be_a_new(EctsModule)
      end

      it "re-renders the 'new' template" do
        post :create, {:ects_module => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {:name => "Module with some courses", :course_ids => [23, 42]}
      }

      it "updates the requested ects_module" do
        ects_module = EctsModule.create! valid_attributes
        create :course, :id => 23
        create :course, :id => 42
        put :update, {:id => ects_module.to_param, :ects_module => new_attributes}, valid_session
        ects_module.reload
        expect(ects_module.courses).to have(2).items
      end

      it "assigns the requested ects_module as @ects_module" do
        ects_module = EctsModule.create! valid_attributes
        put :update, {:id => ects_module.to_param, :ects_module => valid_attributes}, valid_session
        expect(assigns(:ects_module)).to eq(ects_module)
      end

      it "redirects to the ects_module" do
        ects_module = EctsModule.create! valid_attributes
        put :update, {:id => ects_module.to_param, :ects_module => valid_attributes}, valid_session
        expect(response).to redirect_to(ects_module)
      end
    end

    context "with invalid params" do
      it "assigns the ects_module as @ects_module" do
        ects_module = EctsModule.create! valid_attributes
        put :update, {:id => ects_module.to_param, :ects_module => invalid_attributes}, valid_session
        expect(assigns(:ects_module)).to eq(ects_module)
      end

      it "re-renders the 'edit' template" do
        ects_module = EctsModule.create! valid_attributes
        put :update, {:id => ects_module.to_param, :ects_module => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested ects_module" do
      ects_module = EctsModule.create! valid_attributes
      expect {
        delete :destroy, {:id => ects_module.to_param}, valid_session
      }.to change(EctsModule, :count).by(-1)
    end

    it "redirects to the ects_modules list" do
      ects_module = EctsModule.create! valid_attributes
      delete :destroy, {:id => ects_module.to_param}, valid_session
      expect(response).to redirect_to(ects_modules_url)
    end
  end

end
