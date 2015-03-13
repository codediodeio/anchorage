FactoryGirl.define do
  factory :user do
    email "jeff@anchorage.io"
    password "password"
    username "delaneyphx"
    location "Seattle, WA"
    bio "one cool dude"
    boatname "starfire"
    boatmodel "islander 32"
    admin false
  end

end
