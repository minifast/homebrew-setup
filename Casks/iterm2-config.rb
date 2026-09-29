cask "iterm2-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/iterm2.plist", __dir__)}"
  name "iterm2-config"
  desc "Configure iTerm2"
  homepage ""

  generated_script "installer.sh", content: <<~SH
    #!/bin/sh
    ln -sf "#{staged_path}/iterm2.plist" ~/Library/Preferences/com.googlecode.iterm2.plist
  SH

  generated_script "uninstaller.sh", content: <<~SH
    #!/bin/sh
    rm f- ~/Library/Preferences/com.googlecode.iterm2.plist
  SH

  installer script: "installer.sh"
  uninstall script: "uninstaller.sh"
end
