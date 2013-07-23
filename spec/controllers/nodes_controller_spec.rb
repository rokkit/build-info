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
  let(:build_object_3) { create :build_object, user: user_two }

  let!(:node_one) { create :node, sell: build_object_1  }
  let!(:node_two) { create :node, sell: build_object_2  }
  let!(:node_not) { create :node, sell: build_object_3, status: 2  }
  
  describe "GET #show" do
    context "when matched node exists" do
      before do
        sign_in user_one
        get :show, id: node_one
      end
      it { should render_template :show }
      it "should return node" do
        assigns[:node].should == node_one
      end
      it "should return right list of mathed nodes", focus: true do
        node_two.sell.address.country.should == build_object_1.address.country
        node_two.sell.address.street.should == build_object_1.address.street
        assigns[:matched_nodes].should == [node_two]
      end
      it "should not have status 'Exchange complete'" do
        assigns[:matched_nodes].should_not include(node_not)
      end
    end
    context "node don't match'" do
      before do
        sign_in user_one
        node_one.update_attribute :max_price, 1
        get :show, id: node_one
      end
      it { should render_template :show }
      it "should return current node" do
        assigns[:node].should == node_one
      end
      it "should return empty list of mathed nodes" do
        assigns[:matched_nodes].should == []
      end
    end
  end
end
