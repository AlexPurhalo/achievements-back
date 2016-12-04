require 'helper_spec'

describe 'POST Framework' do
  def app
    Frameworks
  end

  before { Frameworks.before { env['api.tilt.root'] = 'app/views' } }

  before do
    post '/frameworks', framework: 'Grape'
  end

  it 'has a 201 status' do
    expect(last_response.status).to eq(201)
  end

  it 'receives serialized data about skills' do
    expect(last_response.body).to eq({ id: 1, framework: 'Grape' }.to_json)
  end

  context 'for framework that is already exist' do
    before { post '/frameworks', framework: 'Grape' }

    it 'shows 422 error' do
      expect(last_response.status).to eq(422)
    end

    it 'renders info about error' do
      expect(last_response.body).to eq({ errors: ['this framework is already exist'] }.to_json)
    end
  end
end