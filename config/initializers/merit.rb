# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)

Merit::Badge.create!(
id: 1,
name: "noob",
description: "Welcome to Anchorage.io!",
custom_fields: { difficulty: :bronze, category: "Starting Out" }
)

Merit::Badge.create!(
id: 2,
name: "autobiographer",
description: "You added a bio",
custom_fields: { difficulty: :bronze, category: "Starting Out" }
)

Merit::Badge.create!(
id: 3,
name: "identity",
description: "You created a username",
custom_fields: { difficulty: :bronze, category: "Starting Out" }
)

Merit::Badge.create!(
id: 4,
name: "cruiser",
description: "Shared 1 Experience",
custom_fields: { difficulty: :gold, category: "Sharing Experiences" }
)

Merit::Badge.create!(
id: 5,
name: "legit cruiser",
description: "Shared 5 Experiences",
custom_fields: { difficulty: :bronze, category: "Sharing Experiences" }
)

Merit::Badge.create!(
id: 6,
name: "hardcore cruiser",
description: "Shared 15 Experiences",
custom_fields: { difficulty: :silver, category: "Sharing Experiences" }
)

Merit::Badge.create!(
id: 7,
name: "epic cruiser",
description: "Shared 30 Experiences",
custom_fields: { difficulty: :gold, category: "Sharing Experiences" }
)

Merit::Badge.create!(
id: 8,
name: "shutterbug",
description: "Shared 1 Photo",
custom_fields: { difficulty: :silver, category: "Sharing Photos" }
)

Merit::Badge.create!(
id: 9,
name: "shutterbug 2",
description: "Shared 5 Photos",
custom_fields: { difficulty: :gold, category: "Sharing Photos"  }
)

Merit::Badge.create!(
id: 10,
name: "shutterbug 3",
description: "Shared 15 Photos",
custom_fields: { difficulty: :gold, category: "Sharing Photos"  }
)

Merit::Badge.create!(
id: 11,
name: "shutterbug 4",
description: "Shared 30 Photos",
custom_fields: { difficulty: :gold, category: "Sharing Photos"  }
)

Merit::Badge.create!(
id: 12,
name: "sailor",
description: "Your Experience was Anchored",
custom_fields: { difficulty: :gold, category: "Getting Anchored" }
)

Merit::Badge.create!(
id: 13,
name: "skipper",
description: "Your Experiences have received 10+ Anchors",
custom_fields: { difficulty: :gold, category: "Getting Anchored"  }
)

Merit::Badge.create!(
id: 14,
name: "captain",
description: "Your Experiences have received 50+ Anchors",
custom_fields: { difficulty: :gold, category: "Getting Anchored"  }
)

Merit::Badge.create!(
id: 15,
name: "admiral",
description: "Your Experiences have received 100+ Anchors",
custom_fields: { difficulty: :gold, category: "Getting Anchored"  }
)

Merit::Badge.create!(
id: 16,
name: "fleet admiral",
description: "Your Experiences have received 250+ Anchors",
custom_fields: { difficulty: :gold, category: "Getting Anchored"  }
)




# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
