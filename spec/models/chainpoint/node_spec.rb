require 'rails_helper'

RSpec.describe Chainpoint::Node, type: :model do
  it { should validate_presence_of :proof_id }
  it { should validate_presence_of :badge }

  describe '#build_from_badge' do
    let(:badge) { create(:badge) }

    context 'when chainpoints call succeeds' do
      before do
        return_value = { 'hashes' => [{ 'proof_id' => 'a_hash' }] }

        allow(Chainpoint::Client).to receive(:submit).and_return(return_value)
      end

      let(:node) { Chainpoint::Node.build_from_badge(badge) }

      it 'should create a node with the correct proof_id' do
        expect(node.proof_id).to eq 'a_hash'
      end

      it 'should link to the correct badge' do
        expect(node.badge).to eq badge
      end
    end

    context 'when chainpoints call fails' do
      before do
        allow(Chainpoint::Client).to receive(:submit).and_return(nil)
      end

      let(:node) { Chainpoint::Node.build_from_badge(badge) }

      it { expect(node).to be_nil }
    end
  end
end
