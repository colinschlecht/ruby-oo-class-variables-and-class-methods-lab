require 'pry'

class Song
    attr_accessor :name, :artist, :genre

    @@count = 0
    @@genres = []
    @@artists = []
    @@names = []

    def initialize(name, artist, genre)
        @@count += 1
        @@genres.push(genre)
        @@artists.push(artist)
        @@names.push(name)
        @name = name
        @artist = artist
        @genre = genre
    end

    def self.count
        @@count
    end

    def self.genres
        @@genres.uniq
    end

    def self.artists
        @@artists.uniq
    end
    
    def self.genre_count
        @@genres.each_with_object(Hash.new(0)){|genre,count| count[genre] +=1}
        #or @@genres.group_by(&:itself).map { |k,v| [k, v.count] }.to_h
        #=> {"rap"=>2, "pop"=>1}
    end
    def self.artist_count
        @@artists.each_with_object(Hash.new(0)){|artist,songcount| songcount[artist] +=1 }
    end

end
