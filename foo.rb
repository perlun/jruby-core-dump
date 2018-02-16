RSpec.describe 'foo' do
  it 'should not core dump when you send the USR2 signal' do
    expect { Process.kill('USR2', Process.pid) }.to raise_error(SignalException, /SIGUSR2/)
  end
end
