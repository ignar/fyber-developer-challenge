require 'rails_helper'

RSpec.describe RequestsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:params) {{
      pub0: 'pub0',
      page: 1,
      uid: 'uid'
    }}

    describe 'views' do
      render_views

      it "renders form" do
        post :create, params
        expect(response).to render_template(partial: 'requests/_form')
      end
    end

    context 'valid request' do
      it 'call OfferApiRequestService' do
        expect(OfferApiRequestService).to receive(:new).and_return(double.as_null_object)
        post :create, request_form: params
      end
    end

    context 'invalid request' do
      it 'does not call OfferApiRequestService' do
        expect(OfferApiRequestService).not_to receive(:new)
        post :create, request_form: {}
      end
    end
  end
end
