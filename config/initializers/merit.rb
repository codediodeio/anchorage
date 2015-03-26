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
id: 101,
name: "noob",
description: "Welcome to Anchorage.io!",
custom_fields: { difficulty: :bronze, category: "Starting Out" }
)

Merit::Badge.create!(
id: 102,
name: "autobiographer",
description: "You added a bio",
custom_fields: { difficulty: :bronze, category: "Starting Out" }
)

Merit::Badge.create!(
id: 103,
name: "individuality",
description: "Upload an avatar image to your profile",
custom_fields: { difficulty: :bronze, category: "Starting Out" }
)

Merit::Badge.create!(
id: 104,
name: "owneroperator",
description: "You added a boat to your profile",
custom_fields: { difficulty: :bronze, category: "Starting Out" }
)

Merit::Badge.create!(
id: 105,
name: "blogger",
description: "You linked your blog to your profile",
custom_fields: { difficulty: :bronze, category: "Starting Out" }
)

# Sharing Experiences

Merit::Badge.create!(
id: 201,
name: "daysailor",
description: "Shared 1 Experience",
custom_fields: { difficulty: :bronze, category: "Sharing Experiences" }
)

Merit::Badge.create!(
id: 202,
name: "weekender",
description: "Shared 5 Experiences",
custom_fields: { difficulty: :bronze, category: "Sharing Experiences" }
)

Merit::Badge.create!(
id: 203,
name: "cruiser",
description: "Shared 15 Experiences",
custom_fields: { difficulty: :silver, category: "Sharing Experiences" }
)

Merit::Badge.create!(
id: 204,
name: "yachtsman",
description: "Shared 30 Experiences",
custom_fields: { difficulty: :gold, category: "Sharing Experiences" }
)

# Sharing Photos

Merit::Badge.create!(
id: 301,
name: "shutterbug",
description: "Shared 1 Photo",
custom_fields: { difficulty: :bronze, category: "Sharing Photos" }
)

Merit::Badge.create!(
id: 302,
name: "paparazzo",
description: "Shared 5 Photos",
custom_fields: { difficulty: :bronze, category: "Sharing Photos"  }
)

Merit::Badge.create!(
id: 303,
name: "photojournalist",
description: "Shared 15 Photos",
custom_fields: { difficulty: :silver, category: "Sharing Photos"  }
)

Merit::Badge.create!(
id: 304,
name: "anseladams",
description: "Shared 30 Photos",
custom_fields: { difficulty: :gold, category: "Sharing Photos"  }
)

# Getting Anchored

Merit::Badge.create!(
id: 401,
name: "railmeat",
description: "Your Experience was Anchored",
custom_fields: { difficulty: :bronze, category: "Getting Anchored" }
)

Merit::Badge.create!(
id: 402,
name: "firstmate",
description: "Your Experiences have received 10+ Anchors",
custom_fields: { difficulty: :bronze, category: "Getting Anchored"  }
)

Merit::Badge.create!(
id: 403,
name: "skipper",
description: "Your Experiences have received 50+ Anchors",
custom_fields: { difficulty: :silver, category: "Getting Anchored"  }
)

Merit::Badge.create!(
id: 404,
name: "captain",
description: "Your Experiences have received 100+ Anchors",
custom_fields: { difficulty: :gold, category: "Getting Anchored"  }
)

Merit::Badge.create!(
id: 405,
name: "admiral",
description: "Your Experiences have received 250+ Anchors",
custom_fields: { difficulty: :gold, category: "Getting Anchored"  }
)

# Anchoring

Merit::Badge.create!(
id: 501,
name: "hooked",
description: "You anchored something",
custom_fields: { difficulty: :bronze, category: "Anchoring" }
)

# Regional Badges

Merit::Badge.create!(
id: 601,
name: "hollywood",
description: "You posted an experience for the Southern California region",
custom_fields: { difficulty: :bronze, category: "Regional Expertise"  }
)

Merit::Badge.create!(
id: 602,
name: "buffalomilk",
description: "You posted an experience for the Catalina region",
custom_fields: { difficulty: :bronze, category: "Regional Expertise"  }
)

Merit::Badge.create!(
id: 603,
name: "windylane",
description: "You posted an experience for the Channel Islands region",
custom_fields: { difficulty: :bronze, category: "Regional Expertise"  }
)

Merit::Badge.create!(
id: 604,
name: "seaworld",
description: "You posted an experience for the San Diego region",
custom_fields: { difficulty: :bronze, category: "Regional Expertise"  }
)

Merit::Badge.create!(
id: 605,
name: "seaworld",
description: "You posted an experience for the Channel Islands region",
custom_fields: { difficulty: :bronze, category: "Regional Expertise"  }
)

Merit::Badge.create!(
id: 606,
name: "goldengate",
description: "You posted an experience for the San Francisco region",
custom_fields: { difficulty: :bronze, category: "Regional Expertise"  }
)

Merit::Badge.create!(
id: 607,
name: "lumbersexual",
description: "You posted an experience for the Seattle region",
custom_fields: { difficulty: :bronze, category: "Regional Expertise"  }
)

Merit::Badge.create!(
id: 608,
name: "hipster",
description: "You posted an experience for the Oregon region",
custom_fields: { difficulty: :bronze, category: "Regional Expertise"  }
)

Merit::Badge.create!(
id: 609,
name: "orca",
description: "You posted an experience for the San Juan region",
custom_fields: { difficulty: :bronze, category: "Regional Expertise"  }
)

Merit::Badge.create!(
id: 610,
name: "haha",
description: "You posted an experience for the Baja California region",
custom_fields: { difficulty: :bronze, category: "Regional Expertise"  }
)

Merit::Badge.create!(
id: 611,
name: "steinbeck",
description: "You posted an experience for the Sea of Cortez region",
custom_fields: { difficulty: :bronze, category: "Regional Expertise"  }
)

# First Badges

Merit::Badge.create!(
id: 701,
name: "columbus",
description: "Share the first experience for an anchorage or marina",
custom_fields: { difficulty: :silver, category: "Pioneer"  }
)

Merit::Badge.create!(
id: 702,
name: "polaroid",
description: "Share the first photo for an anchorage or marina",
custom_fields: { difficulty: :silver, category: "Pioneer"  }
)

Merit::Badge.create!(
id: 703,
name: "pioneer",
description: "Be one of the first 100 members to join Anchorage.io",
custom_fields: { difficulty: :gold, category: "Pioneer"  }
)

Merit::Badge.create!(
id: 704,
name: "earlybird",
description: "Be one of the first 1000 members to join Anchorage.io",
custom_fields: { difficulty: :silver, category: "Pioneer"  }
)


# Regional Combos

Merit::Badge.create!(
id: 801,
name: "puddlejumper",
description: "You posted an experience in North America and the South Pacific",
custom_fields: { difficulty: :gold, category: "Regional Expertise"  }
)

Merit::Badge.create!(
id: 802,
name: "mexicruiser",
description: "You posted an experience in North America and Mexico",
custom_fields: { difficulty: :silver, category: "Regional Expertise"  }
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
