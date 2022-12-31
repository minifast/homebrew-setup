cask "starship-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/starship.toml", __dir__)}"
  name "starship-config"
  desc "Configure the default Starship prompt"
  homepage ""

  stage_only true

  preflight do
    config_dir = Pathname.new(Dir.home).join('.config')
    config_dir.mkpath
    FileUtils.ln_s staged_path.join('starship.toml'), config_dir.join('starship.toml'), force: true
  end

  uninstall_preflight do
    config_dir = Pathname.new(Dir.home).join('.config')
    FileUtils.rm config_dir.join('starship.toml')
  end
end
