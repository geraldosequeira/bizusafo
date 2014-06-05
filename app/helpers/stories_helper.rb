module StoriesHelper
  def positive_votes_count(story)
    count = story.ratings.positive.count

    return "manter" if count.zero?

    return "+ #{count}"
  end

  def negative_votes_count(story)
    count = story.ratings.negative.count

    return "retirar" if count.zero?

    return "- #{count}"
  end

  def disabled_field(story)
    story.new_record? ? nil : "disabled"
  end

  def story_positive_rating_handler(story)
    if can_rate_for?(story)
      link_to positive_votes_count(story), story_positive_path(story), "data-count" => story.ratings.positive.count
    else
      positive_votes_count(story)
    end
  end

  def story_negative_rating_handler(story)
    if can_rate_for?(story)
      link_to negative_votes_count(story), story_negative_path(story), "data-count" => story.ratings.negative.count
    else
      negative_votes_count(story)
    end
  end

  def can_rate_for?(story)
    return false unless current_user
    rates = story.ratings.has_votes_for current_user, "Story"
    story.user != current_user && rates.empty?
  end
end
