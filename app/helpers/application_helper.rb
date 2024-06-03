module ApplicationHelper
  def name(current_user)
    current_user.email.split("@").first.capitalize
  end

  def time_of_day
    current_time = Time.now
    current_hour = current_time.hour

    case current_hour
    when 5..11
      "morning"
    when 12..16
      "afternoon"
    when 17..20
      "evening"
    else
      "night"
    end
  end
end
