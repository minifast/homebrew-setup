cask "sublime-text-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/preferences.sublime-settings", __dir__)}"
  name "sublime-text-config"
  desc "Configure Sublime Text"
  homepage ""

  stage_only true

  preflight_steps do
    mkdir_p "Library/Application Support/Sublime Text/Packages/User", base: :user
    symlink "preferences.sublime-settings", "Library/Application Support/Sublime Text/Packages/User/preferences.sublime-settings", source_base: :source_base, target_base: :user
  end

  uninstall_preflight_steps do
    remove "Library/Application Support/Sublime Text/Packages/User/preferences.sublime-settings", base: :user
  end
end
