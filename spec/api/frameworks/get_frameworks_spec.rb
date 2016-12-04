require 'helper_spec'

describe 'GET frameworks' do
  def app
    Frameworks
  end

  before { Frameworks.before { env['api.tilt.root'] = 'app/views' } }

  before do
    post '/frameworks', framework: 'Grape'
    post '/frameworks', framework: 'Rails'
    post '/frameworks', framework: 'React'
    get '/frameworks'
  end

  it 'has a correct 200 status' do
    expect(last_response.status).to eq(200)
  end

  it 'contains list of frameworks' do
    body = [{ id: 1, framework: 'Grape'}, { id: 2, framework: 'Rails' }, { id: 3, framework: 'React' }]
    expect(last_response.body).to eq(body.to_json)
  end
end