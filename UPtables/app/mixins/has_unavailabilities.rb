module HasUnavailabilities
  def update_unavailabilities(params)
    if params
      new_unavailibilities = params.map{|day_frame| day_frame.split(' ')}.to_set
      old_unavailibilities = unavailabilities.map{|u| [u.weekday_id.to_s, u.timeframe_id.to_s]}.to_set

      to_add = new_unavailibilities - old_unavailibilities
      to_del = old_unavailibilities - new_unavailibilities

      to_add.each do |u|
        unavailable_at! u.first, u.second
      end

      to_del.each do |u|
        available_at! u.first, u.second
      end
    end

    true
  end

  def available_at?(weekday, timeframe)
    not unavailabilities.any? {|u| (u.weekday == weekday) && (u.timeframe == timeframe) }
  end
end
