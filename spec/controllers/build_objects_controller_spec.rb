require 'spec_helper'

describe BuildObjectsController do
  let(:user) { 
    User.any_instance.stubs(:send_devise_confirmation_by_sms).returns(true)
    create :user 
  }
  let(:build_object) do
    BuildObject.any_instance.stubs(:windraw_cost_from_account).returns(true)
    create :build_object, user: user
  end

  
  describe "GET #show" do
    describe "user must not have limit to view own objects" do
      before do
        sign_in user
        100.times do
          get :show, id: build_object
        end
      end
      it { should render_template :show }
    end
    describe "not logged user must have limit to view objects" do
      before do
        100.times do
          get :show, id: build_object
        end
      end
      it { should_not render_template :show }
    end

    describe "when user request printing" do
      before do
        sign_in user
        get :show, id: build_object, format: :pdf
      end
      subject { response }
      it { should be_success }
    end
  end
end
