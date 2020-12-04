class Artist

    attr_accessor :name
    @@song_count = 0

    def initialize(name = nil)
        @name = name
        @songs = []
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.song_count
        Song.all.size
    end

    def add_song(song_name)
        song_name.artist = self # belongs to
        @songs << song_name # has many
        @@song_count += 1
    end

    def add_song_by_name(song_name)
        song = Song.new(song_name)
        @songs << song_name
        song.artist = self
        @@song_count += 1
    end

end
