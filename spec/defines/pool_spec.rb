require 'spec_helper'

describe 'twemproxy::pool' do
  let(:title) { 'beta' }
  
  it do
    should contain_file('/etc/nutcracker/nutcracker.yml').with({
      'ensure' => 'present',
      'owner'  => 'root',
      'group'  => 'root',
      'mode'   => '0444',
    })
  end
end
