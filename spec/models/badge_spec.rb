require 'rails_helper'

RSpec.describe Badge, type: :model do
  describe 'validations' do
    it { should validate_presence_of :badge_uuid  }
    it { should validate_presence_of :issue_date  }
    it { should validate_presence_of :recipient_name }
  end

  describe 'associations' do
    it { should have_one(:chainpoint_node).class_name(Chainpoint::Node) }
  end

  describe '#calculate_hash' do
    let(:badge_uuid) { 'a_uuid' }
    let(:badge) { create(:badge, badge_uuid: badge_uuid) }

    it 'calculate hashes with sha256' do
      expected_hash = Digest::SHA256.hexdigest(badge_uuid)

      expect(badge.calculate_hash).to eq(expected_hash)
    end
  end
end
