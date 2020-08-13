FactoryBot.define do
    factory :category, class: Category do
        title
        association :user
    end
end