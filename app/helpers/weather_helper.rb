module WeatherHelper

  def icon_matcher(icon)
    # Matches Forecast.io Icons to WI Icons
    if icon == 'clear-day' then 'wi wi-day-sunny'
    elsif icon == 'clear-night' then 'wi wi-night-clear'
    elsif icon == 'rain' then 'wi wi-rain-mix'
    elsif icon == 'snow' then 'wi wi-snow'
    elsif icon == 'wind' then 'wi wi-windy'
    elsif icon == 'fog' then 'wi wi-fog'
    elsif icon == 'cloudy' then 'wi wi-cloudy'
    elsif icon == 'partly-cloudy-day' then  'wi wi-day-cloudy'
    elsif icon == 'partly-cloudy-night' then 'wi night-partly-cloudy'
    elsif icon == 'hail' then 'wi wi-hail'
    elsif icon == 'thunderstorm' then 'wi wi-thunderstorm'
    elsif icon == 'tornado' then 'wi wi-tornado'
    else
      "hi hi-question"
    end
  end

  def wind_matcher(speed)
    # beaufort scale based on mph
    if (0..0.70).include?(speed) then "wi wi-wind-beaufort-0"
    elsif (0.71..3.40).include?(speed) then "wi wi-wind-beaufort-1 text-info"
    elsif (3.41..7.40).include?(speed) then "wi wi-wind-beaufort-2 text-info"
    elsif (7.41..12.20).include?(speed) then "wi wi-wind-beaufort-3 text-success"
    elsif (12.21..17.90).include?(speed) then "wi wi-wind-beaufort-4 text-success"
    elsif (17.91..24.10).include?(speed) then "wi wi-wind-beaufort-5 text-success"
    elsif (24.11..31.00).include?(speed) then "wi wi-wind-beaufort-6 text-warning"
    elsif (31.01..38.40).include?(speed) then "wi wi-wind-beaufort-7 text-warning"
    elsif (38.41..46.30).include?(speed) then "wi wi-wind-beaufort-8 text-danger"
    elsif (46.31..54.80).include?(speed) then "wi wi-wind-beaufort-9 text-danger"
    elsif (54.81..63.60).include?(speed) then "wi wi-wind-beaufort-10 text-danger"
    elsif (63.61..72.90).include?(speed) then "wi wi-wind-beaufort-11 text-danger"
    elsif (72.91..300).include?(speed) then "wi wi-wind-beaufort-12 text-danger"
    else
      "hi hi-question"
    end
  end

  def simple_time(time, offset)
    if offset < 0 then o = "%.2i:00" %offset else o = "+%.2i:00" %offset end
    t = Time.at(time).utc.getlocal(o)
    z = t.zone
    "#{t.strftime('%I:%M%p')}"
  end


end
