cask "git-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/gitconfig", __dir__)}"
  name "git-config"
  desc "Configure git"
  homepage ""

  stage_only true

  preflight do
    home_dir = Pathname.new(Dir.home)
    FileUtils.touch home_dir.join('.gitconfig')
    git_config = home_dir.join('.gitconfig').read.split("\n")
    git_config << '[include]' if git_config.index('[include]').nil?
    git_config.insert git_config.index('[include]') + 1, "\tpath = #{staged_path.join('gitconfig')}"
    home_dir.join('.gitconfig').write(git_config.join("\n"))
  end

  uninstall_preflight do
    home_dir = Pathname.new(Dir.home)
    git_config = home_dir.join('.gitconfig').read.split("\n")
    git_config -= ["\tpath = #{staged_path.join('gitconfig')}"]
    home_dir.join('.gitconfig').write(git_config.join("\n"))
  end
end
