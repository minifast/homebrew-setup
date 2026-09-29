cask "tool-versions" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/tool-versions", __dir__)}"
  name "tool-versions"
  desc "Configure asdf .tool-versions file"
  homepage ""

  generated_script "installer.sh", content: <<~SH
    #!/bin/sh
    ln -sf "#{staged_path}/tool-versions" ~/.tool-versions
  SH

  generated_script "uninstaller.sh", content: <<~SH
    #!/bin/sh
    rm -f ~/.tool-versions
  SH

  installer script: "installer.sh"
  uninstall script: "uninstaller.sh"
end
