class RenameTrackUrlToMidiFile < ActiveRecord::Migration
  def change
    rename_column :tracks, :url, :midi_file
  end
end
