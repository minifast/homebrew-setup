cask "inputrc" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/inputrc", __dir__)}"
  name "inputrc"
  desc "Configure readline"
  homepage ""

  stage_only true

  preflight do
    home_dir = Pathname.new(Dir.home)
    FileUtils.ln_s staged_path.join('inputrc'), home_dir.join('.inputrc'), force: true
  end

  uninstall_preflight do
    home_dir = Pathname.new(Dir.home)
    FileUtils.rm home_dir.join('.inputrc')
  end
end
