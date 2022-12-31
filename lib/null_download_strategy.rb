class NullDownloadStrategy < AbstractFileDownloadStrategy
  def initialize(url, name, version, **meta)
    super
  end

  def fetch(timeout: nil)
    end_time = Time.now + timeout if timeout
    cached_location.dirname.mkpath
    symlink_location.dirname.mkpath

    FileUtils.touch(cached_location)
    FileUtils.ln_s cached_location.relative_path_from(symlink_location.dirname), symlink_location, force: true
  end

  def clear_cache
    super
    rm_rf(temporary_path)
  end

  def resolved_time_file_size(timeout: nil)
    [Time.now, 0]
  end
end