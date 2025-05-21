cask "tool-versions" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/tool-versions", __dir__)}"
  name "tool-versions"
  desc "Configure asdf .tool-versions file"
  homepage ""

  stage_only true

  preflight do
    home_dir = Pathname.new(Dir.home)
    FileUtils.ln_s staged_path.join('tool-versions'), home_dir.join('.tool-versions'), force: true
  end

  uninstall_preflight do
    home_dir = Pathname.new(Dir.home)
    FileUtils.rm home_dir.join('.tool-versions')
  end
end
