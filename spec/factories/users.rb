FactoryBot.define do
    sequence :id do |n|
      n
    end
    sequence :name do |n|
        "autoGeneratedSampleName#{n}"
    end

    factory :user, class: User do
        id 
        password {"autoGeneratedSamplePass"}
        name
    end
end