require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:customer_email) }
    it { is_expected.to validate_presence_of(:total) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:fulfilled) }
  end

  context 'associations' do
    it { is_expected.to have_many(:order_products) }
  end
end
