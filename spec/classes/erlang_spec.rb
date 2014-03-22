require 'spec_helper'

describe 'erlang' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "erlang class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should contain_class('erlang::install') }

      end
    end
  end

  context 'unsupported operating system' do
    describe 'erlang class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_class('erlang::install') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
