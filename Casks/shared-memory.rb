cask "shared-memory" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/shared-memory.plist", __dir__)}"
  name "shared-memory"
  desc "Configure shared memory allocation"
  homepage ""

  generated_script "installer.sh", content: <<~SH
    #!/bin/sh
    sudo ln -sf "#{staged_path}/shared-memory.plist" /Library/LaunchDaemons/shared-memory.plist
    sudo chown root:wheel /Library/LaunchDaemons/shared-memory.plist
    sudo launchctl load /Library/LaunchDaemons/shared-memory.plist
  SH

  generated_script "uninstaller.sh", content: <<~SH
    #!/bin/sh
    sudo launchctl unload /Library/LaunchDaemons/shared-memory.plist
    sudo rm /Library/LaunchDaemons/shared-memory.plist
  SH

  installer script: "installer.sh"
  uninstall script: "uninstaller.sh"
end
