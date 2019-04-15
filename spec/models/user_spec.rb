require "rails_helper"

RSpec.describe User, type: :model do
  context 'Associations' do
    it 'has_many posts and dependent upon deletion' do
      associations = described_class.reflect_on_association(:posts)
      expect(associations.macro).to eq :has_many
      expect(associations.options[:dependent]).to eq :destroy
    end

  end
end
