require 'rails_helper'

RSpec.describe Category, type: :model do
  context "titleとuser_idを正しく入力したとき" do
    let(:valid_category) {
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
    } 
    it "バリデーションが通る" do
      expect(valid_category).to be_valid
    end
  end

  describe "titleを検証" do
    context "空文字が入った場合" do
      let(:invalid_category_1) {
        Category.create(
          id: 101,
          title: '',
          user_id: 100
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_category_1.errors[:title]).to be_present
      end
    end

    context "NULLが入った場合" do
      let(:invalid_category_2) {
        Category.create(
          id: 102,
          user_id: 100
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_category_2.errors[:title]).to be_present
      end
    end
  end

  describe "user_idを検証" do
    context "空文字が入った場合" do
      let(:invalid_category_3) {
        Category.create(
          id: 103,
          title: 'sample',
          user_id: ''
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_category_3.errors[:user_id]).to be_present
      end
    end

    context "NULLが入った場合" do
      let(:invalid_category_4) {
        Category.create(
          id: 104,
          title: 'sample'
        )
      }
      it "バリデーションが通らない" do
        expect(invalid_category_4.errors[:user_id]).to be_present
      end
    end
  end

end
