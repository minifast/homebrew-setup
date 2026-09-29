cask "sublime-text-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/preferences.sublime-settings", __dir__)}"
  name "sublime-text-config"
  desc "Configure Sublime Text"
  homepage ""

  generated_script "installer.sh", content: <<~SH
    #!/bin/sh
    mkdir -p ~/Library/Application\\ Support/Sublime\\ Text/Packages/User
    cp "#{staged_path}/preferences.sublime-settings" ~/Library/Application\\ Support/Sublime\\ Text/Packages/User/Preferences.sublime-settings
  SH

  generated_script "uninstaller.sh", content: <<~SH
    #!/bin/sh
    rm -f ~/Library/Application\\ Support/Sublime\\ Text/Packages/User/Preferences.sublime-settings
  SH

  installer script: "installer.sh"
  uninstall script: "uninstaller.sh"
end
