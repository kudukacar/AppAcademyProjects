require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "Get #new" do 
        it "renders the new template" do 
            get :new, {}
            expect(response).to render_template("new")
        end
    end

    describe "Post #create" do 
        context "with invalid params" do 
            it "validates the presence of the user's email and password"
            it "validates that the password is at least 6 characters long"
        end

        context "with valid params" do 
            it "redirects user to bands index on success"
        end
    end

    describe "Show #get" do 
        it "renders the show template" do 
            get :show, {}
            expect(response).to render_template("show")
        end
    end

end
