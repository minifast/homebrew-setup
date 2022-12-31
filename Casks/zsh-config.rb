cask "zsh-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/zshrc", __dir__)}"
  name "zsh-config"
  desc "Configure zsh"
  homepage ""

  stage_only true

  preflight do
    home_dir = Pathname.new(Dir.home)
    FileUtils.touch home_dir.join('.zshrc')
    git_config = home_dir.join('.zshrc').read.split("\n")
    git_config << "source #{staged_path.join('zshrc')}"
    home_dir.join('.zshrc').write(git_config.join("\n"))
  end

  uninstall_preflight do
    home_dir = Pathname.new(Dir.home)
    git_config = home_dir.join('.zshrc').read.split("\n")
    git_config -= ["source #{staged_path.join('zshrc')}"]
    home_dir.join('.zshrc').write(git_config.join("\n"))
  end
end
