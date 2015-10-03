require 'spec_helper'

describe AppRoot do
  it 'has a version number' do
    expect(AppRoot::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
