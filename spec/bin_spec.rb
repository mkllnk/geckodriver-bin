require 'spec_helper'
require 'http'

describe Geckodriver::Bin do
  let(:geckodriver_bin) { Geckodriver::Bin.new }

  RSpec::Matchers.define :be_reachable do
    match do |download_url|
      response = HTTP.head download_url
      location = response["Location"]
      expect(response["Location"]).to include("github-production-release-asset")
      expect(response["Location"]).to include("s3.amazonaws.com")
    end
  end

  describe '#binary_path' do
    context 'on a linux32 platform' do
      before { allow(geckodriver_bin).to receive(:platform) { 'linux32' } }
      it { expect(geckodriver_bin.download_url).to be_reachable }
      it { expect(geckodriver_bin.binary_path).to match(/geckodriver$/) }
    end

    context 'on a linux64 platform' do
      before { allow(geckodriver_bin).to receive(:platform) { 'linux64' } }
      it { expect(geckodriver_bin.download_url).to be_reachable }
      it { expect(geckodriver_bin.binary_path).to match(/geckodriver$/) }
    end

    context 'on a mac platform' do
      before { allow(geckodriver_bin).to receive(:platform) { 'macos' } }
      it { expect(geckodriver_bin.download_url).to be_reachable }
      it { expect(geckodriver_bin.binary_path).to match(/geckodriver$/) }
    end

    context 'on a windows32 platform' do
      before { allow(geckodriver_bin).to receive(:platform) { 'win32' } }
      it { expect(geckodriver_bin.download_url).to be_reachable }
      it { expect(geckodriver_bin.binary_path).to match(/geckodriver\.exe$/) }
    end

    context 'on a windows64 platform' do
      before { allow(geckodriver_bin).to receive(:platform) { 'win64' } }
      it { expect(geckodriver_bin.download_url).to be_reachable }
      it { expect(geckodriver_bin.binary_path).to match(/geckodriver\.exe$/) }
    end
  end
end
