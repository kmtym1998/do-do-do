require 'rails_helper'

RSpec.describe "Home", type: :system, js: true do
  before do
    current_at
    ancient_task
    current_task
    future_task
    created_tasks
  end

  let(:current_at) { Time.current }
  let(:ancient_task) do
    create(
      :task,
      title: (current_at - 1000.year).strftime('%Y%m%d'),
      updated_at: (current_at - 1000.year).strftime('%Y%m%d')
    )
  end
  let(:current_task) do
    create(
      :task,
      title: current_at.strftime('%Y%m%d'),
      updated_at: current_at.strftime('%Y%m%d')
    )
  end
  let(:future_task) do
    create(
      :task,
      title: (current_at + 1000.year).strftime('%Y%m%d'),
      updated_at: (current_at + 1000.year).strftime('%Y%m%d')
    )
  end
  let(:created_tasks) { Task.order(created_at: :desc) }

  let(:titles) do
    all('.task-title')
  end

  describe "ホーム画面にアクセスしたとき" do
    it 'タスク一覧が表示されること' do
        visit '/'
        expect(titles[0].text).to have_content(future_task.updated_at.strftime('%Y%m%d'))
        expect(titles[2].text).to have_content(ancient_task.updated_at.strftime('%Y%m%d'))
    end
  end
end