require 'spec_helper'

# write up RSpec integration tests here
#   see: http://serverspec.org/resource_types.html
describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end
