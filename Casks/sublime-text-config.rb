cask "sublime-text-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/preferences.sublime-settings", __dir__)}"
  name "sublime-text-config"
  desc "Configure Sublime Text"
  homepage ""

  stage_only true

  preflight_steps do
    mkdir_p "~/Library/Application Support/Sublime Text/Packages/User"
    symlink "preferences.sublime-settings", "~/Library/Application Support/Sublime Text/Packages/User/preferences.sublime-settings", source_base: :staged_path, remove_on_uninstall: true
  end
end
