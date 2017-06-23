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

class Movie
  attr_reader :title

  @@all = []

  def initialize(title)
    @title = title
    @@all << self
  end

  def self.find_by_title(title)
    self.all.find do |movie|
      movie.title == title
    end
  end

  def ratings
    Rating.all.select do |rating|
      rating.movie == self
    end
  end

  def viewers
    self.ratings.map { |rating| rating.viewer }
  end

  def average_rating
    scores = self.ratings.map { |rating| rating.score }
    sum = scores.inject(:+).to_f
    avg_rating = sum / (scores.size)
    avg_rating
    # binding.pry
  end

  def self.all
    @@all
  end

end

class Rating
  attr_reader :score, :viewer, :movie

  @@all = []

  def initialize (score, viewer, movie)
    @score = score
    @viewer = viewer
    @movie = movie
    @@all << self
  end

  def self.all
    @@all
  end


end
