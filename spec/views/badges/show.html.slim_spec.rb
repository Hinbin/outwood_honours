# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'badges/show', type: :view do
  let(:badge) { create(:badge) }

  before(:each) do
    @badge = badge
  end

end
