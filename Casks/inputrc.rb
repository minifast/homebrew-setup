cask "inputrc" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/inputrc", __dir__)}"
  name "inputrc"
  desc "Configure readline"
  homepage ""

  generated_script "installer.sh", content: <<~SH
    #!/bin/sh
    ln -sf "#{staged_path}/inputrc" ~/.inputrc
  SH

  generated_script "uninstaller.sh", content: <<~SH
    #!/bin/sh
    rm -f ~/.inputrc
  SH

  installer script: "installer.sh"
  uninstall script: "uninstaller.sh"
end
