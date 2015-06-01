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
      "fa fa-question"
    end
  end

  def wind_matcher(speed)
    # beaufort scale based on mph
    if (0..0.70).include?(speed) then "wi wi-beafort-0"
    elsif (0.71..3.40).include?(speed) then "wi wi-beafort-1"
    elsif (3.41..7.40).include?(speed) then "wi wi-beafort-2"
    elsif (7.41..12.20).include?(speed) then "wi wi-beafort-3"
    elsif (12.21..17.90).include?(speed) then "wi wi-beafort-4"
    elsif (17.91..24.10).include?(speed) then "wi wi-beafort-5"
    elsif (24.11..31.00).include?(speed) then "wi wi-beafort-6"
    elsif (31.01..38.40).include?(speed) then "wi wi-beafort-7"
    elsif (38.41..46.30).include?(speed) then "wi wi-beafort-8"
    elsif (46.31..54.80).include?(speed) then "wi wi-beafort-9"
    elsif (54.81..63.60).include?(speed) then "wi wi-beafort-10"
    elsif (63.61..72.90).include?(speed) then "wi wi-beafort-11"
    elsif (72.91..300).include?(speed) then "wi wi-beafort-12"
    else
      "fa fa-question"
    end
  end

  def simple_time(time)
    Time.at(time).strftime("%I:%M%p")
  end


end