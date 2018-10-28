require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#shipped?' do
    it { is_expected.to respond_to(:shipped?) }

    context 'when a shipped date exists' do
      before { subject.update(shipped_at: Time.now) }
      it { is_expected.to be_shipped }
    end

    context 'when no shipped date is present' do
      it { is_expected.to_not be_shipped }
    end
  end

  describe '#settings' do
    it { is_expected.to respond_to(:settings) }

    context 'when expedite is present' do
      before { subject.settings(expedite: true) }
      it { is_expected.to be_expedited }
    end

    context 'when expedite is false' do
      before { subject.settings(expedite: false) }
      it { expect(subject.expedited?).to be(false) }
    end

    context 'when returns is present' do
      before { subject.settings(returns: true) }
      it { is_expected.to be_returnable }
    end

    context 'when returns is false' do
      before { subject.settings(returns: false) }
      it { expect(subject.returnable?).to be(false) }
    end

    context 'when warehouse is present' do
      before { subject.settings(warehouse: true) }
      it { is_expected.to be_warehoused }
    end

    context 'when warehouse is false' do
      before { subject.settings(warehouse: false) }
      it { expect(subject.warehoused?).to be(false) }
    end
  end

  describe 'scopes' do
    let!(:shipped_order) { Order.create!(shipped_at: Time.now) }
    let!(:unshipped_order) { Order.create! }

    describe '.shipped' do
      it 'only returns the shipped order' do
        expect(Order.shipped.count).to eq(1)
        expect(Order.shipped).to include(shipped_order)
        expect(Order.shipped).not_to include(unshipped_order)
      end
    end

    describe '.unshipped' do
      it 'only returns the unshipped order' do
        expect(Order.unshipped.count).to eq(1)
        expect(Order.unshipped).to include(unshipped_order)
        expect(Order.unshipped).not_to include(shipped_order)
      end
    end
  end

  describe 'associations' do
    let(:widget) { Widget.create!(name: Faker::Appliance.equipment) }
    let(:unit_price) { Faker::Number.number(2) }
    let(:order) do
      Order.create!(
        line_items_attributes: [
          widget_id: widget.id,
          unit_price: unit_price
        ]
      )
    end

    it 'should create associated LineItems' do
      expect(order).to be_valid
      expect(order.line_items.count).to eq(1)
      expect(order.line_items.first.widget_id).to eq(widget.id)
      expect(order.line_items.first.unit_price).to eq(unit_price.to_i)
    end
  end
end
