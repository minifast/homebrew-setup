cask "git-duet-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/git-authors", __dir__)}"
  name "git-duet-config"
  desc "Configure git-duet"
  homepage ""

  generated_script "installer.sh", content: <<~SH
    #!/bin/sh
    ln -sf "#{staged_path}/git-authors" ~/.git-authors
  SH

  generated_script "uninstaller.sh", content: <<~SH
    #!/bin/sh
    rm -f ~/.git-authors
  SH

  installer script: "installer.sh"
  uninstall script: "uninstaller.sh"
end
