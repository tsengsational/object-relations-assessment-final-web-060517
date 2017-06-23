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
