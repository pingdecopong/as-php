require 'serverspec'

set :backend, :exec


describe package('php') do
  it { should be_installed }
end

describe command('php -v') do
  its(:stdout) { should match /PHP 5.5/ }
end

describe file('/etc/php.ini') do
  its(:content) { should match /\[xdebug\]/ }
end
