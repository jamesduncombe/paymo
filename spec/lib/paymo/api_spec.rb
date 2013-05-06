require 'spec_helper'

describe Paymo::API do

  it 'returns a result when getting' do
    puts Paymo::API.get :auth_login, username: 'asdasd'
  end

end