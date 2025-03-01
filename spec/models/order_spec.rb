require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:customer_email) }
    it { is_expected.to validate_presence_of(:total) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:fulfilled) }
    it do
        should validate_inclusion_of(:fulfilled).
        in_array([true, false])
    end
  end

  context 'associations' do
    it { is_expected.to have_many(:order_products) }
  end
end