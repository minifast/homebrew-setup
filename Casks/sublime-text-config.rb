cask "sublime-text-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/preferences.sublime-settings", __dir__)}"
  name "sublime-text-config"
  desc "Configure Sublime Text"
  homepage ""

  stage_only true

  preflight do
    sublime_dir = Pathname.new(Dir.home).join("Library/Application Support/Sublime Text/Packages/User")
    sublime_dir.mkpath
    FileUtils.ln_s staged_path.join('preferences.sublime-settings'), sublime_dir.join('Preferences.sublime-settings'), force: true
  end

  uninstall_preflight do
    sublime_dir = Pathname.new(Dir.home).join("Library/Application Support/Sublime Text/Packages/User")
    FileUtils.rm sublime_dir.join('Preferences.sublime-settings')
  end
end
