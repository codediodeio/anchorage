json.query "Unit"
json.suggestions @locations.collect {|l| l.name } + @regions.collect { |r| r.name }
