cask "git-duet-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/git-authors", __dir__)}"
  name "git-duet-config"
  desc "Configure git-duet"
  homepage ""

  stage_only true

  preflight_steps do
    symlink "git-authors", "~/.git-authors", source_base: :staged_path, remove_on_uninstall: true
  end
end
