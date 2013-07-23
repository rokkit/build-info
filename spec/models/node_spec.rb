require "spec_helper"

describe Node do
  describe "#request_for_exchange_by_node" do
        let(:user) { 
          User.any_instance.stubs(:send_devise_confirmation_by_sms).returns(true)
          create :user 
        }

        let(:build_object) do
          BuildObject.any_instance.stubs(:windraw_cost_from_account).returns(true)
          create :build_object, user: user
        end
        let(:build_object_two) { create :build_object, user: user }
        let!(:node) { create :node, sell: build_object  }
        let!(:node_two) { create :node, sell: build_object_two  }
    context "valid situation" do
      before do
        node.request_for_exchange_by_node node_two
      end
      subject { node }
      it "should create relationship betweet nodes" do
        node.relationships.first.node.should eql node
        node.relationships.first.node_two.should eql node_two
      end
      its(:status) { should == 1 }
    end
    context "invalid situation" do
      before do
        node.update_attribute :status, 2
      end
      it "should raise error when status node is EXCHANGE CONFIRMED" do
        expect {  
          node.request_for_exchange_by_node node_two
        }.to raise_error
      end
    end
  end
end
