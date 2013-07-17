require 'spec_helper'

describe NodesController do
  let(:user_one) { 
    User.any_instance.stubs(:send_devise_confirmation_by_sms).returns(true)
    create :user 
  }
  let(:user_two) { create :user, email: "user_two@mail.ru" }
  let(:build_object_1) do
    BuildObject.any_instance.stubs(:windraw_cost_from_account).returns(true)
    create :build_object, user: user_one
  end
  let(:build_object_2) { create :build_object, user: user_two }

  let!(:node_one) { create :node, sell: build_object_1  }
  let!(:node_two) { create :node, sell: build_object_2  }
  
  describe "GET #show" do
    before do
      sign_in user_one
      get :show, id: node_one.id
    end
    it { should render_template :show }
    it "should return node" do
      assigns[:node].should == node_one
    end
    it "should return right list of mathed nodes" do
      assigns[:matched_nodes].should == [node_two]
    end
  end
end
