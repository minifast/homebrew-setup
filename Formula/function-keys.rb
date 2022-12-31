require_relative '../lib/null_download_strategy'

class FunctionKeys < Formula
  url "https://example.com/formula", using: NullDownloadStrategy
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  version "1.0.0"

  def install
    system "defaults", "write", "NSGlobalDomain", "AppleKeyboardUIMode", "-int", "3"
    system "defaults", "write", "NSGlobalDomain", "com.apple.keyboard.fnState", "-boolean", "true"
    FileUtils.touch(prefix.join("installed"))
  end

  test do
    system "true"
  end
end
