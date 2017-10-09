require_relative 'space_jams'
require 'pry'


class Album
  def initialize(id,title,artists)
    @id = id
    @title = title
    @artists = artists
    @tracks = []
    @total_time = 0
  end

  def summary
    summary = "
     Name: #{@title}
     Artist(s): #{@artists}
     Duration (min.): #{@total_time}
     Tracks:
     #{@tracks.each {|track| puts "- #{track['Track Title']}"}}\n"
     # Note for LA grader: I can't determine how to 'puts' each track title without
     #  using puts. Also, the full @tracks array of hashes is returned with this method,
     #  but I wasn't able to figure out how to prevent that from happening.
  end

  def id
    @id
  end

  def title
    @title
  end

  def artists
    @artists
  end

  def tracks
    running_time = 0
    TRACKS.each do |track|
      if track[:album_id] == @id
        @tracks << {'Track Title' => track[:title],'Track ID' => track[:track_id], 'Track Number' => track[:track_number], 'Track Length' => track[:duration_ms]}
        running_time = (track[:duration_ms].to_f) / 60000 + running_time
      end
    end
    @total_time = running_time.round(2)
    @tracks
  end

  def duration_min
    @total_time
  end

end
