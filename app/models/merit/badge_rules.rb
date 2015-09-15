# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      grant_on 'users/registrations#create', badge_id: 101, badge: 'noob', model_name: 'User'
      grant_on 'users/registrations#update', badge_id: 101, badge: 'noob', model_name: 'User'

      grant_on 'users/registrations#update', badge_id: 102, badge: 'autobiographer', temporary: true, model_name: 'User' do |user|
        user.bio.length > 1
      end

      grant_on 'users/registrations#update', badge_id: 103, badge: 'identity', temporary: true, model_name: 'User' do |user|
        user.image.present? == true
      end

      grant_on 'users/registrations#update', badge_id: 104, badge: 'boatowner', temporary: true, model_name: 'User' do |user|
        user.boatname.present? == true
      end

      grant_on 'users/registrations#update', badge_id: 105, badge: 'blogger', temporary: true, model_name: 'User' do |user|
        user.blog.present? == true
      end

      grant_on 'messages#create', badge_id: 106, to: :sender do |message|
        message.sender.sent_messages.count >= 1
      end

      grant_on 'locations#create', badge_id: 903, to: :user do |location|
        location.user.locations.count >= 25
      end

      grant_on 'experiences#create', badge_id: 201, to: :user do |experience|
        experience.user.experiences.count >= 1
      end

      grant_on 'experiences#create', badge_id: 202, to: :user do |experience|
        experience.user.experiences.count >= 5
      end

      grant_on 'experiences#create', badge_id: 203, to: :user do |experience|
        experience.user.experiences.count >= 15
      end

      grant_on 'experiences#create', badge_id: 204, to: :user do |experience|
        experience.user.experiences.count >= 30
      end

      grant_on 'experiences#create', badge_id: 205, to: :user do |experience|
        experience.user.experiences.count >= 75
      end

      # Photos

      grant_on 'images#create', badge_id: 301, to: :user do |image|
        image.user.images.count >= 1
      end

      grant_on 'images#create', badge_id: 302, to: :user do |image|
        image.user.images.count >= 5
      end

      grant_on 'images#create', badge_id: 303, to: :user do |image|
        image.user.images.count >= 15
      end

      grant_on 'images#create', badge_id: 304, to: :user do |image|
        image.user.images.count >= 40
      end

      grant_on 'images#create', badge_id: 305, to: :user do |image|
        image.user.images.count >= 75
      end

      # Getting Anchors

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 401, to: :anchorable_user do |anchor|
        anchor.anchorable_user.total_anchors >= 1
      end

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 402, to: :anchorable_user do |anchor|
        anchor.anchorable_user.total_anchors >= 10
      end

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 403, to: :anchorable_user do |anchor|
        anchor.anchorable_user.total_anchors >= 50
      end

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 404, to: :anchorable_user do |anchor|
        anchor.anchorable_user.total_anchors >= 100
      end

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 405, to: :anchorable_user do |anchor|
        anchor.anchorable_user.total_anchors >= 250
      end

      # Anchoring Content

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 501, to: :user do |anchor|
        anchor.user.anchors.count >= 1
      end

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 502, to: :user do |anchor|
        anchor.user.anchors.count >= 10
      end

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 503, to: :user do |anchor|
        anchor.user.anchors.count >= 100
      end

      # Regional

      regional('southern-california', 601)
      regional('catalina', 602)
      regional('channel-islands', 603)
      regional('san-francisco-bay', 604)
      regional('pacific-northwest', 605)
      regional('pacific-baja', 606)
      regional('sea-of-cortez', 607)
      regional('banderas-bay', 608)
      regional('hawaii', 609)
      regional('canada', 610)
      regional('atlantic-southeast', 611)
      regional('atlantic-northeast', 612)
      regional('gulf-coast', 613)
      regional('caribbean', 614)
      regional('australia', 615)
      regional('new-zealand', 616)

      # regional("southern-california", 609)
      # regional("southern-california", 610)

      # grant_on 'experiences#create', badge_id: 601, to: :user do |experience|
      #   r = Region.find_by_permalink("southern-california")
      #   experience.location.regions.include?(r)
      # end
      #
      # grant_on 'experiences#create', badge_id: 602, to: :user do |experience|
      #   r = Region.find_by_permalink("catalina")
      #   experience.location.regions.include?(r)
      # end
      #
      # grant_on 'experiences#create', badge_id: 603, to: :user do |experience|
      #   r = Region.find_by_permalink("channel-islands")
      #   experience.location.regions.include?(r)
      # end
      #
      # grant_on 'experiences#create', badge_id: 604, to: :user do |experience|
      #   r = Region.find_by_permalink("san-francisco-bay")
      #   experience.location.regions.include?(r)
      # end
      #
      # grant_on 'experiences#create', badge_id: 605, to: :user do |experience|
      #   r = Region.find_by_permalink("pacific-northwest")
      #   experience.location.regions.include?(r)
      # end
      #
      # grant_on 'experiences#create', badge_id: 606, to: :user do |experience|
      #   r = Region.find_by_permalink("baja-california")
      #   experience.location.regions.include?(r)
      # end
      #
      # grant_on 'experiences#create', badge_id: 607, to: :user do |experience|
      #   r = Region.find_by_permalink("sea-of-cortez")
      #   experience.location.regions.include?(r)
      # end
      #
      # grant_on 'experiences#create', badge_id: 608, to: :user do |experience|
      #   r = Region.find_by_permalink("sea-of-cortez")
      #   experience.location.regions.include?(r)
      # end

      ### Regional Combos
      # See Helper Method Below pass region's permalink!
      regional_combo('mexico', 'california', 802)
      regional_combo('southern-california', ['northern-california', 'oregon', 'washington', 'canada'], 803)
      regional_combo('pacific-islands-and-oceania', 'north-america', 804)

      # Firsts

      grant_on 'experiences#create', badge_id: 701, to: :user, multiple: true do |experience|
        experience == experience.location.experiences.first
      end

      grant_on 'images#create', badge_id: 702, to: :user, multiple: true do |image|
        image == image.location.images.first
      end

      grant_on 'users/registrations#create', badge_id: 703, model_name: 'User' do
        User.count < 101
      end

      grant_on 'users/registrations#create', badge_id: 704, model_name: 'User' do
        u = User.count
        u > 101 && u < 1001
      end

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 705, to: :user do |anchor|
        anchor.anchorable_user.total_anchors <= 1
      end

      # Knowledge Base

      grant_on 'locations#create', badge_id: 901, to: :user do |location|
        location.user.locations.count >= 1
      end

      grant_on 'locations#create', badge_id: 902, to: :user do |location|
        location.user.locations.count >= 10
      end

      grant_on 'locations#create', badge_id: 903, to: :user do |location|
        location.user.locations.count >= 25
      end

      # If it creates user, grant badge
      # Should be "current_user" after registration for badge to be granted.
      # Find badge by badge_id, badge_id takes presidence over badge
      # grant_on 'users#create', badge_id: 7, badge: 'just-registered', to: :itself

      # If it has 10 comments, grant commenter-10 badge
      # grant_on 'comments#create', badge: 'commenter', level: 10 do |comment|
      #   comment.user.comments.count == 10
      # end

      # If it has 5 votes, grant relevant-commenter badge
      # grant_on 'comments#vote', badge: 'relevant-commenter',
      #   to: :user do |comment|
      #
      #   comment.votes.count == 5
      # end

      # Changes his name by one wider than 4 chars (arbitrary ruby code case)
      # grant_on 'registrations#update', badge: 'autobiographer',
      #   temporary: true, model_name: 'User' do |user|
      #
      #   user.name.length > 4
      # end
    end

    private

    def regional(region, badge_id)
      grant_on 'experiences#create', badge_id: badge_id, to: :user do |experience|
        r = Region.find_by_permalink(region)
        experience.location.regions.include?(r)
      end
    end

    # Determines if user has posed image or experience in two separate regions.
    def regional_combo(region_a, region_b, badge_id)
      grant_on 'experiences#create', badge_id: badge_id, to: :user, temporary: true do |experience|
        ra = Region.find_by_permalink(region_a).location_ids
        rb = Region.find_by_permalink(region_b).location_ids
        u = experience.user
        test_a = u.experiences.where(location_id: ra).any? || u.images.where(location_id: ra).any?
        test_b = u.experiences.where(location_id: rb).any? || u.images.where(location_id: rb).any?
        test_a && test_b
      end

      grant_on 'images#create', badge_id: badge_id, to: :user, temporary: true do |image|
        ra = Region.find_by_permalink(region_a).location_ids
        rb = Region.find_by_permalink(region_a).location_ids
        u = image.user
        test_a = u.experiences.where(location_id: ra).any? || u.images.where(location_id: ra).any?
        test_b = u.experiences.where(location_id: rb).any? || u.images.where(location_id: rb).any?
        test_a && test_b
      end
    end
  end
end
