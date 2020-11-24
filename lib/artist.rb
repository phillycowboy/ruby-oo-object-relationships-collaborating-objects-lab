require 'pry'

class Artist 
    @@all = []
    attr_accessor :name, :song 
    
    def initialize(name)
        @name = name 
        @@all << self 
    end
    
    def self.all 
        @@all 
end

def songs 
    Song.all.select do |song|
        song.artist == self 
    end
end

def add_song(song)
    song.artist = self 
end

def self.find_or_create_by_name(name)
   found_artist = Artist.all.find do |artist|
        artist.name == name
    end
    if found_artist
        found_artist
    else
        Artist.new(name)
    end
end

def print_songs
    songs.each do |song|
        puts song.name
    end
end


end 
