require_relative '../lib/null_download_strategy'

class DockSettings < Formula
  url "https://example.com/formula", using: NullDownloadStrategy
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  version "1.0.0"

  def install
    system "defaults", "write", "com.apple.dock", "persistent-apps", "-array"
    system "defaults", "write", "com.apple.dock", "autohide", "-boolean", "true"
    system "defaults", "write", "com.apple.dock", "orientation", "-string", "left"
    FileUtils.touch(prefix.join("installed"))
  end

  test do
    system "true"
  end
end
