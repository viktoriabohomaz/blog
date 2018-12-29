# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy do
  subject { described_class.new(user, user) }

  let(:user) { FactoryBot.create(:user) }

  context 'being a copywriter' do
    let(:user) { FactoryBot.create(:user) }

    it { is_expected.to forbid_action(:index) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_new_and_create_actions }
  end

  context 'being an admin' do
    let(:user) { FactoryBot.create(:user, role: 'admin') }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:destroy) }
    it { is_expected.to permit_new_and_create_actions }
  end
end
