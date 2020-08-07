FactoryBot.define do
    factory :category, class: Category do
        id
        title
        association :user
    end
end