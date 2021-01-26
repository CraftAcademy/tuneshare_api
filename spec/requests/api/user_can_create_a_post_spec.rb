RSpec.describe 'POST /api/posts', type: :request do
  describe 'successfully create a post' do
    before do
      post '/api/posts',
           params: {
             post: {
               track_name: 'One Beer',
               artists: 'MF DOOM',
               image: 'https://i.scdn.co/image/ab67616d0000b27378c9eee96fec41ec24c0ae1c',
               preview_url: 'https://p.scdn.co/mp3-preview/4ae054ff5e142a8aef2018c4f83e00d1ac764370?cid=9165f2ed52ac4632b2c23038c2fbe1d9',
               description: 'I listen to this when Im drinking beer'
             }
           }
    end

    it 'is expected to return a 201 status' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return a success message' do
      expect(response_json['message']).to eq 'Your post was successfully created!'
    end
  end
  describe 'unsuccessfully create a post' do
    before do
      post '/api/posts',
           params: {
             post: {
               artists: 'MF DOOM',
               image: 'https://i.scdn.co/image/ab67616d0000b27378c9eee96fec41ec24c0ae1c',
               preview_url: 'https://p.scdn.co/mp3-preview/4ae054ff5e142a8aef2018c4f83e00d1ac764370?cid=9165f2ed52ac4632b2c23038c2fbe1d9',
               description: 'I listen to this when Im drinking beer'
             }
           }
    end

    it 'is expected to return a 422 status' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return a error message when track name missing' do
      expect(response_json['message']).to eq "track_name and can't be blank"
    end
  end
end
