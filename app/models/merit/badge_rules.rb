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

      grant_on 'users/registrations#create', badge_id: 1, badge: "noob", model_name: 'User'

      grant_on 'users/registrations#update', badge_id: 2, badge: 'autobiographer', temporary: true, model_name: "User" do |user|
        user.bio.length > 1
      end

      grant_on 'experiences#create', badge_id: 4, badge: 'cruiser', to: :user do |experience|
        experience.user.experiences.count >= 1
      end

      grant_on 'experiences#create', badge_id: 5, badge: 'legit cruiser', to: :user do |experience|
        experience.user.experiences.count >= 5
      end

      grant_on 'experiences#create', badge_id: 6, badge: 'hardcore cruiser', to: :user do |experience|
        experience.user.experiences.count >= 15
      end

      grant_on 'experiences#create', badge_id: 7, badge: 'epic cruiser', to: :user do |experience|
        experience.user.experiences.count >= 30
      end

      # Photos

      grant_on 'images#create', badge_id: 8, to: :user do |image|
        image.user.images.count >= 1
      end

      grant_on 'images#create', badge_id: 9, to: :user do |image|
        image.user.images.count >= 5
      end

      grant_on 'images#create', badge_id: 10, to: :user do |image|
        image.user.images.count >= 15
      end

      grant_on 'images#create', badge_id: 11, to: :user do |image|
        image.user.images.count >= 30
      end

      # Anchors

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 12, to: :anchorable_user do |anchor|
        anchor.anchorable_user.anchored_images.count + anchor.anchorable_user.anchored_experiences.count >= 1
      end

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 13, to: :anchorable_user do |anchor|
        anchor.anchorable_user.anchored_images.count + anchor.anchorable_user.anchored_experiences.count >= 10
      end

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 14, to: :anchorable_user do |anchor|
        anchor.anchorable_user.anchored_images.count + anchor.anchorable_user.anchored_experiences.count >= 50
      end

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 15, to: :anchorable_user do |anchor|
        anchor.anchorable_user.anchored_images.count + anchor.anchorable_user.anchored_experiences.count >= 100
      end

      grant_on ['anchors#anchor', 'anchors#anchor_img'], badge_id: 16, to: :anchorable_user do |anchor|
        anchor.anchorable_user.anchored_images.count + anchor.anchorable_user.anchored_experiences.count >= 250
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
  end
end
