require 'rails_helper'

RSpec.describe User, type: :model do
  context "nameとpasswordを正しく入力したとき" do
    let(:valid_user) {
      User.create(
        id: 100,
        name: 'sample',
        password: 'sample',
        sort_state: 0
      )
    } 
    it "バリデーションが通る" do
      expect(valid_user).to be_valid
    end
  end


  describe "nameを検証" do
    context "空文字が入った場合" do
      let(:invalid_task_1) {
        User.create(
          id: 101,
          name: '',
          password: 'sample',
          sort_state: 0
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_task_1.errors[:name]).to be_present
      end
    end

    context "NULLが入った場合" do
      let(:invalid_task_2) {
        User.create(
          id: 102,
          password: 'sample',
          sort_state: 0
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_task_2.errors[:name]).to be_present
      end
    end
  end


  describe "passwordを検証" do
    context "空文字が入った場合" do
      let(:invalid_task_3) {
        User.create(
          id: 103,
          name: 'sample',
          password: '',
          sort_state: 0
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_task_3.errors[:password]).to be_present
      end
    end

    context "NULLが入った場合" do
      let(:invalid_task_4) {
        User.create(
          id: 104,
          name: 'sample',
          sort_state: 0
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_task_4.errors[:password]).to be_present
      end
    end
  end

end
