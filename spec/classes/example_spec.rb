require 'spec_helper'

describe 'gosu' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "gosu class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('gosu::params') }
          it { is_expected.to contain_class('gosu::install').that_comes_before('gosu::config') }
          it { is_expected.to contain_class('gosu::config') }
          it { is_expected.to contain_class('gosu::service').that_subscribes_to('gosu::config') }

          it { is_expected.to contain_service('gosu') }
          it { is_expected.to contain_package('gosu').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'gosu class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('gosu') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
