cask "starship-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/starship.toml", __dir__)}"
  name "starship-config"
  desc "Configure the default Starship prompt"
  homepage ""

  generated_script "installer.sh", content: <<~SH
    #!/bin/sh
    mkdir -p ~/.config
    ln -sf "#{staged_path}/starship.toml" ~/.config/starship.toml
  SH

  generated_script "uninstaller.sh", content: <<~SH
    #!/bin/sh
    rm -f ~/.config/starship.toml
  SH

  installer script: "installer.sh"
  uninstall script: "uninstaller.sh"
end
