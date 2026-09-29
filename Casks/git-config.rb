cask "git-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/gitconfig", __dir__)}"
  name "git-config"
  desc "Configure git"
  homepage ""

  preflight_steps do
    symlink "gitconfig", "~/.gitconfig.minifast", source_base: :staged_path, remove_on_uninstall: true
  end

  generated_script "installer.sh", content: <<~SH
    #!/bin/sh
    git config set --global include.path ~/.gitconfig.minifast
  SH
  installer script: "installer.sh"
end
