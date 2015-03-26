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
    banned false
  end

  factory :user_two, class: User do
    email "breezy@anchorage.io"
    password "password"
    username "breezy"
    location "Seattle, WA"
    bio "one cool gal"
    boatname "starfire"
    boatmodel "islander 32"
    admin false
    banned false
  end

  factory :admin, class: User  do
    email "admin@anchorage.io"
    password "password"
    username "admin"
    admin true
    banned false
  end

  factory :banned, class: User  do
    email "banned@anchorage.io"
    password "password"
    username "banned"
    admin false
    banned true
  end

end
