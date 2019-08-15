require "rails_helper"
#require_relative "../support/devise"

RSpec.describe DocsController, type: :controller do
  let(:user){user=User.create(:email => "a@b.c", :password => "password")}
  before(:each){sign_in user}
  after(:each){sign_out user}

  describe "GET index" do
    it "assing all docs to @docs in index action" do
      get :index
      doc = subject.current_user.docs.build(:title => "title", :content => "content")
      docs = Doc.all
      expect(assigns["docs"]).to match_array(docs)
    end
    it "status must be OK" do
      get :index
      expect(response).to have_http_status(:ok)
    end
    it "must renders 'index' template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assing doc by id to @doc in show action" do
      doc = subject.current_user.docs.build(:title => "title34234234", :content => "content")
      doc.save
      get :show, :params => {:id => doc.id}
      expect(assigns["doc"]).to eq(doc)
    end

    it "status must be OK" do
      doc = subject.current_user.docs.build(:title => "title34234234", :content => "content")
      doc.save
      get :show, :params => {:id => doc.id}
      expect(response).to have_http_status(:ok)
    end

    it "must renders 'show' template" do
      doc = subject.current_user.docs.build(:title => "title34234234", :content => "content")
      doc.save
      get :show, :params => {:id => doc.id}
      expect(response).to render_template("show")
    end
  end

  describe "PUT update" do
    it "edit doc.title when call edit action" do
      doc = subject.current_user.docs.build(:title => "title34234234", :content => "content")
      doc.save
      get :edit, :params => {:id => doc.id}
      doc = assigns("doc")
      put :update, :params => {:id => doc.id, :doc => {:title => "new_title", :content => "new_content"}}
  
      expect(assigns["doc"].title).to eq("new_title")
    end

    it "status must be FOUND" do
      doc = subject.current_user.docs.build(:title => "title34234234", :content => "content")
      doc.save
      get :edit, :params => {:id => doc.id}
      doc = assigns("doc")
      put :update, :params => {:id => doc.id, :doc => {:title => "new_title", :content => "new_content"}}
  
      expect(response).to have_http_status(:found)
    end

    it "must redirect to doc" do
      doc = subject.current_user.docs.build(:title => "title34234234", :content => "content")
      doc.save
      get :edit, :params => {:id => doc.id}
      doc = assigns("doc")
      put :update, :params => {:id => doc.id, :doc => {:title => "new_title", :content => "new_content"}}
  
      expect(response).to redirect_to(doc)
    end
  end

  describe "DELETE destroy" do
    it "delete doc when call destroy action" do
      doc = subject.current_user.docs.build(:title => "title34234234", :content => "content")
      doc.save
      delete :destroy, :params => {:id => doc.id}
      expect(Doc.last).to eq(nil)
    end

    it "status must be FOUND" do
      doc = subject.current_user.docs.build(:title => "title34234234", :content => "content")
      doc.save
      delete :destroy, :params => {:id => doc.id}
      expect(response).to have_http_status(:found)
    end

    it "must redirect to docs_path" do
      doc = subject.current_user.docs.build(:title => "title34234234", :content => "content")
      doc.save
      delete :destroy, :params => {:id => doc.id}
      expect(response).to redirect_to(docs_path)
    end
  end
end