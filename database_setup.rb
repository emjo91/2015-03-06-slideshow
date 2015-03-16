# configure :development do
#   require 'sqlite3'
# end

configure :development do
  DATABASE = SQLite3::Database.new("slides.db")
end
# DATABASE.results_as_hash = true

unless ActiveRecord::Base.connection.table_exists?(:slides)
 ActiveRecord::Base.connection.create_table :users do |t|
 t.text :title
 t.text :body_text
 t.integer :slide_order
 end
end


unless ActiveRecord::Base.connection.table_exists?(:users)
 ActiveRecord::Base.connection.create_table :users do |t|
 t.text :username
 t.text :password
end
end

# Only uncomment this when you are ready to put the files up.
# Slide.create([
#   {title: "Border Collie", body_text: "The Border Collie is a working and herding
#    dog breed developed in the Anglo-Scottish border region for herding livestock,
#    especially sheep. It was specifically bred for intelligence and obedience."
#    slide_order: 1},
#    {title: "Australian Cattle Dog", body_text: "The Australian Cattle Dog, or simply
#    Cattle Dog, is a breed of herding dog originally developed in Australia for droving
#    cattle over long distances across rough terrain.", slide_order: 2},
#    {title: "English Shepherd", body_text: "English Shepherds are working dogs, valued
#    for their versatility, loyalty, and intelligence. They make wonderful companions
#    and working partners in homes where their intelligence, spirit, and devotion are
#    understood and appreciated.", slide_order: 3},
#    {title: "Norwegian Elkhound", body_text: "The Norwegian Elkhound is one of the
#    ancient Northern Spitz-type breed of dog and is the National Dog of Norway. The
#    Elkhound has served as a hunter, guardian, herder, and defender.", slide_order: 4},
#    {title: "Mudi", body_text: "The Mudi is a rare herding dog breed from Hungary.
#    It is closely related to the Puli and Pumi, from which it was separated in the 1930s.
#    Today, the Mudi is bred for work, companionship, and show.", slide_order: 5},
#    {title: "Belgian Tervuren", body_text: "Tervurens are highly energetic, intelligent
#    dogs who require a job to keep them occupied. This can be herding, obedience, agility,
#    flyball, tracking, or protection work. They are also found working as Search and Rescue
#    (SAR) dogs, finding missing people and avalanche victims. Tervurens that are not kept
#    sufficiently busy can become hyperactive or destructive.", slide_order: 6},
#    {title: "Australian Keplie", body_text: "The Australian Kelpie, or simply Kelpie,
#    is an Australian sheep dog successful at mustering and droving with little or no
#    guidance. It is a medium-sized dog and comes in a variety of colours. The Kelpie
#    has been exported throughout the world and is used to muster livestock, primarily
#    sheep, cattle and goats.", slide_order: 7},
#    {title: "Pharaoh Hound", body_text: "The Pharaoh Hound is a breed of dog and the
#    national hound of the Mediterranean nation of Malta. Its native name is Kelb tal-Fenek
#    in Maltese, which means -Rabbit dog-. The dog is traditionally used for hunting rabbit
#    in the Maltese Islands.", slide_order: 8},
#    {title: "Smooth Collie", body_text: "The Smooth Collie is a breed of dog developed
#    originally for herding. It is a short-coated version of the Rough Collie of Lassie
#    fame. Some breed organisations consider the smooth-coat and rough-coat dogs to be
#    variations of the same breed.", slide_order: 9},
#    {title: "Dutch Shepherd", body_text: "The Dutch Shepherd Dog is a herding dog
#    of Dutch origin. They were used by shepherds and farmers who needed a versatile
#    dog, with few demands, and a dog that was able to adapt to a harsh and meager existence",
#    slide_order: 10}
#    ])

# This is the old DB set up

# DATABASE.execute("CREATE TABLE IF NOT EXISTS slides(id INTEGER PRIMARY KEY, title TEXT NOT NULL,
#                   body_text TEXT NOT NULL, slide_order INTEGER)")
                  
# DATABASE.execute("CREATE TABLE IF NOT EXISTS users(id INTEGER PRIMARY KEY, username TEXT NOT NULL,
#                   password TEXT NOT NULL)")

# DATA TO BE ENTERED INTO TABLE

# slide1 = Slide.new({"title"=>"Border Collie", "body_text"=>"The Border Collie is a working and herding dog breed developed in the Anglo-Scottish border region for herding livestock, especially sheep. It was specifically bred for intelligence and obedience.", "slide_order"=>1})
# slide2 = Slide.new({"title"=>"Australian Cattle Dog", "body_text"=>"The Australian Cattle Dog, or simply Cattle Dog, is a breed of herding dog originally developed in Australia for droving cattle over long distances across rough terrain.", "slide_order"=>2})
# slide3 = Slide.new({"title"=>"English Shepherd", "body_text"=>"English Shepherds are working dogs, valued for their versatility, loyalty, and intelligence. They make wonderful companions and working partners in homes where their intelligence, spirit, and devotion are understood and appreciated.", "slide_order"=>3})
# slide4 = Slide.new({"title"=>"Norwegian Elkhound", "body_text"=>"The Norwegian Elkhound is one of the ancient Northern Spitz-type breed of dog and is the National Dog of Norway. The Elkhound has served as a hunter, guardian, herder, and defender.", "slide_order"=>4})
# slide5 = Slide.new({"title"=>"Mudi", "body_text"=>"The Mudi is a rare herding dog breed from Hungary. It is closely related to the Puli and Pumi, from which it was separated in the 1930s. Today, the Mudi is bred for work, companionship, and show.", "slide_order"=>5})
# slide6 = Slide.new({"title"=>"Belgian Tervuren", "body_text"=>"Tervurens are highly energetic, intelligent dogs who require a job to keep them occupied. This can be herding, obedience, agility, flyball, tracking, or protection work. They are also found working as Search and Rescue (SAR) dogs, finding missing people and avalanche victims. Tervurens that are not kept sufficiently busy can become hyperactive or destructive.", "slide_order"=>6})
# slide7 = Slide.new({"title"=>"Kelpie", "body_text"=>"The Australian Kelpie, or simply Kelpie, is an Australian sheep dog successful at mustering and droving with little or no guidance. It is a medium-sized dog and comes in a variety of colours. The Kelpie has been exported throughout the world and is used to muster livestock, primarily sheep, cattle and goats.", "slide_order"=>7})
# slide8 = Slide.new({"title"=>"Pharaoh Hound", "body_text"=>"The Pharaoh Hound is a breed of dog and the national hound of the Mediterranean nation of Malta. Its native name is Kelb tal-Fenek in Maltese, which means -Rabbit dog-. The dog is traditionally used for hunting rabbit in the Maltese Islands.", "slide_order"=>8})
# slide9 = Slide.new({"title"=>"Smooth Collie", "body_text"=>"The Smooth Collie is a breed of dog developed originally for herding. It is a short-coated version of the Rough Collie of Lassie fame. Some breed organisations consider the smooth-coat and rough-coat dogs to be variations of the same breed.", "slide_order"=>9})
# slide10 = Slide.new({"title"=>"Dutch Shepherd", "body_text"=>"The Dutch Shepherd Dog is a herding dog of Dutch origin. They were used by shepherds and farmers who needed a versatile dog, with few demands, and a dog that was able to adapt to a harsh and meager existence", "slide_order"=>10})