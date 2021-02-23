require 'rails_helper'

describe 'Urls API', type: :request do
  let(:headers) do
    {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json',
    }
  end

  describe 'POST /api/v1/urls' do
    let(:method) { :post }
    let(:api_path) { '/api/v1/urls' }
    let(:url) { create(:url) }

    context 'valid parameters' do
      let(:input_url_params) { { 'long_url' => 'qwerty/hgfdsa/zxcvbn' } }
      
      it 'creates a new short_url' do
        expect {
          do_request(
            method, api_path, 
            params: { url: input_url_params }.to_json, 
            headers: headers 
          )
        }.to change(Url, :count).by(1)
      end

      it 'returns a short_url' do
        do_request(
          method, api_path, 
          params: { url: input_url_params }.to_json, 
          headers: headers 
        )
        expect(response).to have_http_status(:created)
        expect(json['url']).to include('token')
      end
    end

    context 'invalid parameters' do
      let(:input_url_params) { {'long_url' => ''} }

      it 'returns an error' do
        do_request(
          method, api_path, 
          params: { url: input_url_params }.to_json, 
          headers: headers 
        )
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end
