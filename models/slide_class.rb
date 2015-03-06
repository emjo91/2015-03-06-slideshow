class Slide
  attr_reader :id
  
  attr_accessor :title, :body_text, :order
  
  def initialize(options)
    @id = options["id"]
    @title = options["title"]
    @body_text = options["body_text"]
    @slide_order = options["slide_order"]
  end
  
  # This insert method is working.
  def insert
    DATABASE.execute("INSERT INTO slides (title, body_text, slide_order) VALUES ('#{@title}', '#{@body_text}', #{@slide_order})")
    @id = DATABASE.last_insert_row_id
  end
  
  #finds an id record in the database, and returns the object.
  def find(id)
    DATABASE.execute("SELECT * FROM slides WHERE id = #{id}")
  end
  
  # This is something that I'll need.
  def update
    DATABASE.execute("")
  end
  
  # This terminate method is working.
  def terminate
    DATABASE.execute("DROP TABLE slides")
  end
  
end #end Slide Class