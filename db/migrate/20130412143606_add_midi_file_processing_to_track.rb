class AddMidiFileProcessingToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :midi_file_processing, :boolean
  end
end
