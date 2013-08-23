require "spec_helper"

describe Node do
  let(:user) { 
    User.any_instance.stubs(:send_devise_confirmation_by_sms).returns(true)
    create :user
  }
  let(:user_two) { create :user,email: "e@ma.ru" }

  let(:build_object) do
    BuildObject.any_instance.stubs(:windraw_cost_from_account).returns(true)
    BuildObject.any_instance.stubs(:geocode).returns([1,1]) 
    create :build_object, user: user
  end
  let(:build_object_two) { create :build_object, user: user_two }
  let(:build_object_3) { create :build_object, user: user_two }
  let!(:node) { create :node, sell: build_object  }
  let!(:node_two) { create :node, sell: build_object_two  }
  let!(:node_three) { create :node, sell: build_object_3  }

  describe "#request_for_exchange_by_node" do
    context "valid situation" do
      before do
        node.request_for_exchange_by_node node_two
        node.request_for_exchange_by_node node_three
      end
      subject { node }
      it "should create relationship betweet nodes" do
        node.relationships.first.node.should eql node
        node.relationships.first.node_two.should eql node_two

        node.relationships.last.node.should == node
        node.relationships.last.node_two.should == node_three
      end
      its(:status) { should == 1 }
    end
    context "invalid situation" do
      it "should raise error when user try exhange with own object" do
        expect {
         node.request_for_exchange_by_node node
        }.to raise_error
      end
      it "should raise error when status node is EXCHANGE CONFIRMED" do
        node.update_attribute :status, 2
        expect {  
          node.request_for_exchange_by_node node_two
        }.to raise_error
      end
    end
  end
  describe "#accept_request_for_exchange_by_node!", focus: true do
      before do
        node.request_for_exchange_by_node node_two
        node.request_for_exchange_by_node node_three
      end
      subject { -> {  node.accept_request_for_exchange_by_node! node_two } }
      it { should change { node.status }.from(1).to(2) }
      it { should change { node_two.status }.from(0).to(2) }
      it "should remove other relationships with other nodes" do
        node.accept_request_for_exchange_by_node! node_two
        node.relationships.count.should == 1
      end
  end
end
