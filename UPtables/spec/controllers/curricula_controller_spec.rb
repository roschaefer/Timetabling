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

RSpec.describe CurriculaController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Curriculum. As you add validations to Curriculum, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {:name => "Informatik Bachelor"}
  }

  let(:invalid_attributes) {
    {:name => nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CurriculaController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all curricula as @curricula" do
      curriculum = Curriculum.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:curricula)).to eq([curriculum])
    end
  end

  describe "GET #show" do
    it "assigns the requested curriculum as @curriculum" do
      curriculum = Curriculum.create! valid_attributes
      get :show, {:id => curriculum.to_param}, valid_session
      expect(assigns(:curriculum)).to eq(curriculum)
    end
  end

  describe "GET #new" do
    it "assigns a new curriculum as @curriculum" do
      get :new, {}, valid_session
      expect(assigns(:curriculum)).to be_a_new(Curriculum)
    end
  end

  describe "GET #edit" do
    it "assigns the requested curriculum as @curriculum" do
      curriculum = Curriculum.create! valid_attributes
      get :edit, {:id => curriculum.to_param}, valid_session
      expect(assigns(:curriculum)).to eq(curriculum)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Curriculum" do
        expect {
          post :create, {:curriculum => valid_attributes}, valid_session
        }.to change(Curriculum, :count).by(1)
      end

      it "assigns a newly created curriculum as @curriculum" do
        post :create, {:curriculum => valid_attributes}, valid_session
        expect(assigns(:curriculum)).to be_a(Curriculum)
        expect(assigns(:curriculum)).to be_persisted
      end

      it "redirects to the created curriculum" do
        post :create, {:curriculum => valid_attributes}, valid_session
        expect(response).to redirect_to(Curriculum.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved curriculum as @curriculum" do
        post :create, {:curriculum => invalid_attributes}, valid_session
        expect(assigns(:curriculum)).to be_a_new(Curriculum)
      end

      it "re-renders the 'new' template" do
        post :create, {:curriculum => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {:name => "Module with some courses", :ects_module_ids => [8, 88]}
      }

      it "updates the requested curriculum" do
        
        create :ects_module, :id => 8
        create :ects_module, :id => 88
        
        curriculum = Curriculum.create! valid_attributes
        put :update, {:id => curriculum.to_param, :curriculum => new_attributes}, valid_session
        curriculum.reload
        
        expect(curriculum.ects_modules).to have(2).items
      end

      it "assigns the requested curriculum as @curriculum" do
        curriculum = Curriculum.create! valid_attributes
        put :update, {:id => curriculum.to_param, :curriculum => valid_attributes}, valid_session
        expect(assigns(:curriculum)).to eq(curriculum)
      end

      it "redirects to the curriculum" do
        curriculum = Curriculum.create! valid_attributes
        put :update, {:id => curriculum.to_param, :curriculum => valid_attributes}, valid_session
        expect(response).to redirect_to(curriculum)
      end
    end

    context "with invalid params" do
      it "assigns the curriculum as @curriculum" do
        curriculum = Curriculum.create! valid_attributes
        put :update, {:id => curriculum.to_param, :curriculum => invalid_attributes}, valid_session
        expect(assigns(:curriculum)).to eq(curriculum)
      end

      it "re-renders the 'edit' template" do
        curriculum = Curriculum.create! valid_attributes
        put :update, {:id => curriculum.to_param, :curriculum => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested curriculum" do
      curriculum = Curriculum.create! valid_attributes
      expect {
        delete :destroy, {:id => curriculum.to_param}, valid_session
      }.to change(Curriculum, :count).by(-1)
    end

    it "redirects to the curricula list" do
      curriculum = Curriculum.create! valid_attributes
      delete :destroy, {:id => curriculum.to_param}, valid_session
      expect(response).to redirect_to(curricula_url)
    end
  end

end
