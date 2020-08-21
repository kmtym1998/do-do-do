require 'rails_helper'

RSpec.describe Task, type: :model do
  context "titleとuser_idとcategory_idを正しく入力したとき" do
    let(:valid_task) {
      User.create(
        id: 100,
        name: 'sample',
        password: 'sample',
        sort_state: 0
      )
      Category.create(
        id: 100,
        title: 'sample',
        user_id: 100
      )
      Task.create(
        id: 100,
        title: 'sample',
        user_id: 100,
        category_id: 100
      )
    } 
    it "バリデーションが通る" do
      expect(valid_task).to be_valid
    end
  end


  describe "titleを検証" do
    context "空文字が入った場合" do
      let(:invalid_task_1) {
        Task.create(
          id: 101,
          title: '',
          user_id: 100,
          category_id: 100
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_task_1.errors[:title]).to be_present
      end
    end

    context "NULLが入った場合" do
      let(:invalid_task_2) {
        Task.create(
          id: 102,
          user_id: 100,
          category_id: 100
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_task_2.errors[:title]).to be_present
      end
    end
  end


  describe "user_idを検証" do
    context "空文字が入った場合" do
      let(:invalid_task_3) {
        Task.create(
          id: 103,
          title: 'sample',
          user_id: '',
          category_id: 100
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_task_3.errors[:user_id]).to be_present
      end
    end

    context "NULLが入った場合" do
      let(:invalid_task_4) {
        Task.create(
          id: 104,
          title: 'sample',
          category_id: 100
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_task_4.errors[:user_id]).to be_present
      end
    end
  end


  describe "category_idを検証" do
    context "空文字が入った場合" do
      let(:invalid_task_5) {
        Task.create(
          id: 105,
          title: 'sample',
          user_id: 100,
          category_id: ''
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_task_5.errors[:category_id]).to be_present
      end
    end

    context "NULLが入った場合" do
      let(:invalid_task_6) {
        Task.create(
          id: 106,
          title: 'sample',
          user_id: 100
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_task_6.errors[:category_id]).to be_present
      end
    end
  end


end
