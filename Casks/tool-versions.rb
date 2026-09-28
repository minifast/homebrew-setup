cask "tool-versions" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/tool-versions", __dir__)}"
  name "tool-versions"
  desc "Configure asdf .tool-versions file"
  homepage ""

  stage_only true

  preflight_steps do
    symlink "tool-versions", ".tool-versions", source_base: :source_base, target_base: :user
  end

  uninstall_preflight_steps do
    remove ".tool-versions", base: :user
  end
end
