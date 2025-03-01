require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
  end

  context 'associations' do
    it { is_expected.to have_one_attached(:image) }
    it { is_expected.to have_many(:stocks) }
    it { is_expected.to have_many(:order_products) }
  end
end