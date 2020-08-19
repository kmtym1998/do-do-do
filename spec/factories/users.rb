FactoryBot.define do
    sequence :name do |n|
        "auto_generated#{n}"
    end

    factory :user, class: User do
        password {"sample_pass"}
        name
        sort_state 0
    end
end