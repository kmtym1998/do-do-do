FactoryBot.define do
    factory :category, class: Category do
        id {Time.parse(Time.now).to_i}
        title
        association :user
    end
end