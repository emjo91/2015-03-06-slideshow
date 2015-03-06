require 'sqlite3'

DATABASE = SQLite3::Database.new("slides.db")
DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS slides(id INTEGER PRIMARY KEY, title TEXT NOT NULL, 
                  body_text TEXT NOT NULL, slide_order INTEGER)")

# DATA TO BE ENTERED INTO TABLE

# slide1 = Slide.new({"title"=>"Border Collie", "body_text"=>"Very smart.", "slide_order"=>1})
# slide2 = Slide.new({"title"=>"Australian Cattle Dog", "body_text"=>"Naughty.", "slide_order"=>2})
# slide3 = Slide.new({"title"=>"English Shepherd", "body_text"=>"Super Sweet, derpy.", "slide_order"=>3})
# slide4 = Slide.new({"title"=>"Australian Shepherd", "body_text"=>"Bubbly.", "slide_order"=>4})
# slide5 = Slide.new({"title"=>"Collie", "body_text"=>"Lassie!", "slide_order"=>5})
# slide6 = Slide.new({"title"=>"German Shepherd", "body_text"=>"Schutzhund.", "slide_order"=>6})
# slide7 = Slide.new({"title"=>"Kelpie", "body_text"=>"Australia, mate.", "slide_order"=>7})
# slide8 = Slide.new({"title"=>"Greyhound", "body_text"=>"Not annorexic.", "slide_order"=>8})
# slide9 = Slide.new({"title"=>"Smooth Collie", "body_text"=>"Bald Lassie?", "slide_order"=>9})
# slide10 = Slide.new({"title"=>"Dutch Shepherd", "body_text"=>"So wow.", "slide_order"=>10})