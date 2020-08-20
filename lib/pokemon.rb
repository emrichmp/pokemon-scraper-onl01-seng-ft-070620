class Pokemon
  attr_accessor :id, :name, :type, :db
  # attr_reader :id
  
  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?,?);
    SQL
    db.execute(sql, name, type)
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?;
    SQL
    poke = db.execute(sql, id).flatten
    name = poke[1]
    type = poke[2]
    Pokemon.new(id, name, type, db)
  end
end
