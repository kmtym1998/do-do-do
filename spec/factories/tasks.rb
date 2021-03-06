FactoryBot.define do
    sequence :title do |n|
        "auto_generated#{n}"
    end

    factory :task, class: Task do
        title
        deadline{ Time.now + 1.hour }
        priority {0}
        state {0}
        memo {'sample memo'}
        category
        user
    end
end