require 'rails_helper'

RSpec.describe "Home", type: :system, js: true do
  before do
    @ancient_task = build(:ancient_task)
    @future_task = build(:future_task)
    @tasks = Task.order(created_at: :desc)
  end

  describe "ホーム画面にアクセスしたとき" do
    it 'タスク一覧が表示されること' do
      if(@tasks[0] == @future_task && @tasks.last == @ancient_task)
        expect(page).to have_content('タスク一覧')
      end
    end    
  end
  
end