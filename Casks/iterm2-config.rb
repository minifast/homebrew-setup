cask "iterm2-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/iterm2.plist", __dir__)}"
  name "iterm2-config"
  desc "Configure iTerm2"
  homepage ""

  stage_only true

  preflight_steps do
    symlink "iterm2.plist", "~/Library/Preferences/com.googlecode.iterm2.plist", source_base: :staged_path, remove_on_uninstall: true
  end
end
