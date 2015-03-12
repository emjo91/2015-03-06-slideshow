class Slide < ActiveRecord::Base
  
  # Public: #to_hash
  # Changes the object to a Hash.
  #
  # Parameters:
  # id: Integer
  # title: String
  # body_text: String
  # slide_order: Integer
  #
  # Returns:
  # Object: As Hash.
  #
  # State Changes:
  # Sets the object to as Hash
  def to_hash
    {
      id: id,
      title: title,
      body_text: body_text,
      slide_order: slide_order
    }
  end

end #end Slide Class

# This code has been rendered obselete by ActiveRecord

  # attr_reader :id
#
#   attr_accessor :title, :body_text, :slide_order
#
#   def initialize(options)
#     @id = options["id"]
#     @title = options["title"]
#     @body_text = options["body_text"]
#     @slide_order = options["slide_order"]
#   end
#
#
#   # This insert method is working.
#   # This inserts new objects into the database.
#   def insert
#     DATABASE.execute("INSERT INTO slides (title, body_text, slide_order)
#                       VALUES ('#{@title}', '#{@body_text}', #{@slide_order})")
#     @id = DATABASE.last_insert_row_id
#   end
#
#
#   # This works.
#   # Finds an id record in the database, and returns the object.
#   def self.find(id)
#     result = DATABASE.execute("SELECT * FROM slides WHERE id = #{id}")[0]
#     self.new(result)
#   end
#
#
#   # This works.
#   # This updates a currently exisiting record, and returns the object of it.
#   def update
#     DATABASE.execute("UPDATE slides SET id = #{@id}, title = '#{@title}',
#                                body_text = '#{@body_text}', slide_order = #{@slide_order}
#                                WHERE id = #{@id}")[0]
#   end
#
#
#   # This method does work.
#   # This deletes a particular record, in the slides table.
#   def self.delete(id)
#     DATABASE.execute("DELETE FROM slides where id = #{id}")
#   end
#
#
#   # This works.
#   # This terminate method is working.
#   def self.terminate
#     DATABASE.execute("DROP TABLE slides")
#   end