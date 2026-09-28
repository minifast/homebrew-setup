cask "git-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/gitconfig", __dir__)}"
  name "git-config"
  desc "Configure git"
  homepage ""

  stage_only true

  preflight_steps do
    symlink "gitconfig", ".gitconfig.minifast", source_base: :source_base, target_base: :user
    run "git", args: ["config", "set", "--global", "include.path", "{{user}}/.gitconfig.minifast"]
  end

  uninstall_preflight_steps do
    run "git", args: ["config", "unset", "--global", "include.path"]
    remove "{{user}}/.gitconfig.minifast"
  end
end
