require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe "Home", type: :system, js: true do
  it 'タスク一覧が表示されること' do
    visit '/'
    expect(page).to have_content('タスク一覧')
  end
end