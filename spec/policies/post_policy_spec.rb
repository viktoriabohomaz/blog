# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostPolicy do

  subject { described_class.new(user, post) }

  let(:post) { FactoryBot.create(:post) }

  context 'being a visitor' do
    let(:user) { nil }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to forbid_new_and_create_actions }
  end

  context 'being a copywriter' do
    let(:user) { FactoryBot.create(:user) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to forbid_action(:destroy) }
    it { is_expected.to permit_new_and_create_actions }
  end

  context 'being an admin' do
    let(:user) { FactoryBot.create(:user, role: 'admin') }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_action(:destroy) }
    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to permit_edit_and_update_actions }
  end
end
