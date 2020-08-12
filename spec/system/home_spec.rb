require 'rails_helper'

RSpec.describe "Home", type: :system, js: true do
  describe "ホーム画面にアクセスしたとき" do
    it 'タスク一覧が表示されること' do
      visit '/'
      expect(page).to have_content('タスク一覧')
    end    
  end
  
end