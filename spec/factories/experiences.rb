FactoryGirl.define do
  factory :experience do
    user nil
    location nil
    body "MyText"*10
  end

end
