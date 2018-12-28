# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'association' do
    it { should belong_to(:user) }
  end

  context 'validation' do
  	it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end  
end
