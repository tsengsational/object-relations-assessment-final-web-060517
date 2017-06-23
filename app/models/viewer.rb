class Viewer
  attr_reader :first_name, :last_name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    names = name.split(" ")
    @first_name = names[0]
    @last_name = names[1]
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def find_by_name(name)
    Viewer.all.find do |viewer|
      viewer.full_name == name
    end
  end

  def create_rating(score, movie)
    rating = Rating.new(score, self, movie)
  end
end
