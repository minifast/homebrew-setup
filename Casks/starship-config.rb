cask "starship-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/starship.toml", __dir__)}"
  name "starship-config"
  desc "Configure the default Starship prompt"
  homepage ""

  stage_only true

  preflight_steps do
    mkdir_p "~/.config"
    symlink "starship.toml", "~/.config/starship.toml", source_base: :staged_path, remove_on_uninstall: true
  end
end
