require 'rails_helper'

RSpec.describe "Home", type: :system, js: true do
  before do
    binding.pry
    ancient_task
    future_task
    created_tasks
  end

  let(:current_at) { Time.current }
  let(:ancient_task) do
    create(
      :task,
      title: (current_at - 1.day).strftime('%Y%m%d'),
      updated_at: (current_at - 1.day).strftime('%Y%m%d')
    )
  end
  let(:future_task) do
    create(
      :task,
      title: current_at.strftime('%Y%m%d'),
      updated_at: current_at.strftime('%Y%m%d')
    )
  end
  let(:created_tasks) { Task.order(created_at: :desc) }

  describe "ホーム画面にアクセスしたとき" do
    it 'タスク一覧が表示されること' do
        expect(page).to have_content(current_at.strftime('%Y%m%d'))
    end
  end
end