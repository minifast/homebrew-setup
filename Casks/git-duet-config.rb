cask "git-duet-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/git-authors", __dir__)}"
  name "git-duet-config"
  desc "Configure git-duet"
  homepage ""

  stage_only true

  preflight_steps do
    symlink "git-authors", ".authors", source_base: :source_base, target_base: :user
  end

  uninstall_preflight_steps do
    remove "{{user}}/.git-authors"
  end
end
