require 'forecast_io'

ForecastIO.configure do |configuration|
  configuration.api_key = Figaro.env.forecast_key
end
