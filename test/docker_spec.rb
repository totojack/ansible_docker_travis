describe service('docker') do
  it { should be_enabled }
end

describe service('docker') do
  it { should be_running.under('systemd') }
end

describe port(2376) do
  it { should be_listening }
end