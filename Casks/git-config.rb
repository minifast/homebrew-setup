cask "git-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/gitconfig", __dir__)}"
  name "git-config"
  desc "Configure git"
  homepage ""

  generated_script "installer.sh", content: <<~SH
    #!/bin/sh
    ln -sf "#{staged_path}/gitconfig" ~/.gitconfig.minifast
    git config set --global include.path ~/.gitconfig.minifast
  SH

  generated_script "uninstaller.sh", content: <<~SH
    #!/bin/sh
    rm -f ~/.gitconfig.minifast
    git config unset --global include.path
  SH

  installer script: "installer.sh"
  uninstall script: "uninstaller.sh"
end
