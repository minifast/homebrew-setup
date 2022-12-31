cask "iterm2-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/iterm2.plist", __dir__)}"
  name "iterm2-config"
  desc "Configure iTerm2"
  homepage ""

  stage_only true

  preflight do
    preferences_dir = Pathname.new(Dir.home).join("Library").join("Preferences")
    preferences_dir.mkpath
    FileUtils.ln_s staged_path.join('iterm2.plist'), preferences_dir.join('com.googlecode.iterm2.plist'), force: true
  end

  uninstall_preflight do
    preferences_dir = Pathname.new(Dir.home).join("Library").join("Preferences")
    FileUtils.rm preferences_dir.join('com.googlecode.iterm2.plist')
  end
end
