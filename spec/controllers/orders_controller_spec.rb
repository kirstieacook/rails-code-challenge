require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe '#index' do
    subject { get :index }
    it { is_expected.to have_http_status(:ok) }
  end

  describe '#show' do
    let(:order) { Order.create! }
    subject { get :show, params: { id: order.id } }
    it { is_expected.to have_http_status(:ok) }
  end

  describe '#create' do
    let(:widget) { Widget.create!(name: Faker::Appliance.equipment) }
    let(:valid_params) do
      {
        order: {
          line_items_attributes: [
            widget_id: widget.id,
            unit_price: Faker::Number.number(2)
          ]
        }
      }
    end
    let(:invalid_params) do
      {
        order: {
          line_items_attributes: [
            widget_id: nil,
            unit_price: nil
          ]
        }
      }
    end

    context 'when the order create is successful' do
      subject { post :create, params: valid_params }
      it { is_expected.to have_http_status(:found) }
    end

    context 'when the order create is not successful' do
      subject { post :create, params: invalid_params }
      it { is_expected.to have_http_status(:ok) } # We're rendering #new if the order create fails.
    end
  end
end
