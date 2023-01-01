cask "git-duet-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/git-authors", __dir__)}"
  name "git-duet-config"
  desc "Configure git-duet"
  homepage ""

  stage_only true

  preflight do
    home_dir = Pathname.new(Dir.home)
    FileUtils.cp staged_path.join('git-authors'), home_dir.join('.git-authors')
  end

  uninstall_preflight do
    home_dir = Pathname.new(Dir.home)
    FileUtils.rm home_dir.join('.git-authors')
  end
end
