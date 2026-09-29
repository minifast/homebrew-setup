cask "tool-versions" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/tool-versions", __dir__)}"
  name "tool-versions"
  desc "Configure asdf .tool-versions file"
  homepage ""

  stage_only true

  preflight_steps do
    symlink "tool-versions", "~/.tool-versions", source_base: :staged_path, remove_on_uninstall: true
  end
end
