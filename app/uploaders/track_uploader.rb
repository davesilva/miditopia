# encoding: utf-8

class TrackUploader < CarrierWave::Uploader::Base
  include ::CarrierWave::Backgrounder::Delay

  storage :file

  after :store, :delete_temp_wav

  version :ogg do
    process :convert_to_ogg

    def full_filename(for_file)
      filename_for_type(for_file, 'ogg')
    end
  end

  version :mp3 do
    process :convert_to_mp3

    def full_filename(for_file)
      filename_for_type(for_file, 'mp3')
    end
  end

  def store_dir
    'uploads'
  end

  def filename
    @name ||= "#{md5}#{File.extname(super)}" if super
  end

  def full_filename(for_file)
    filename_for_type(for_file, 'mid')
  end

  def md5
    chunk = model.send(mounted_as)
    @md5 ||= Digest::MD5.hexdigest(chunk.read)
  end

  def extension_white_list
    %w(mid)
  end

private

  def wav_path
    File.join(root, cache_dir, "#{md5}.wav")
  end

  def soundfont
    paths = [ENV['SOUNDFONT_PATH'],
             "/usr/share/sounds/sf2/FluidR3_GM.SF2",
             "/usr/share/soundfonts/fluidr3/FluidR3GM.SF2"]

    paths.each { |p| return p if p && File.exists?(p) }
  end

  def make_temp_wav
    mid_path = file.path

    unless File.exists?(wav_path)
      unless system("fluidsynth -nli #{soundfont} -F #{wav_path} #{mid_path}")
        raise CarrierWave::ProcessingError.new("Failed to convert #{mid_path} to wav")
      end
    end
  end

  def delete_temp_wav(file)
    File.delete(wav_path) if File.exists?(wav_path)
  end

  def convert_to_ogg
    make_temp_wav
    system("oggenc -r -B 16 -C 2 #{wav_path} -o #{current_path}")
    unless File.exists?(current_path)
      raise CarrierWave::ProcessingError.new("Failed to convert #{wav_path} to ogg")
    end
  end

  def convert_to_mp3
    make_temp_wav
    system("lame #{wav_path} #{current_path}")
    unless File.exists?(current_path)
      raise CarrierWave::ProcessingError.new("Failed to convert #{wav_path} to mp3")
    end
  end

  def filename_for_type(file, ext)
    parent_name = File.basename(file, '.mid')
    base_name = parent_name.chomp(File.extname(parent_name))
    File.join(ext, "#{base_name}.#{ext}")
  end

end
