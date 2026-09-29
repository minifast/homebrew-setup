cask "zsh-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/zshrc", __dir__)}"
  name "zsh-config"
  desc "Configure zsh"
  homepage ""

  generated_script "installer.sh", content: <<~SH
    #!/bin/sh
    cp "#{staged_path}/zshrc" ~/.zshrc.minifast
    ZSH_SOURCE_PATTERN=$(grep "source ~/.zshrc.minifast" ~/.zshrc)
    if [ -z "${ZSH_SOURCE_PATTERN}" ]
    then
      echo "source ~/.zshrc.minifast" >> ~/.zshrc
    fi
  SH

  generated_script "uninstaller.sh", content: <<~SH
    #!/bin/sh
    ZSH_SOURCE_PATTERN=$(grep "source ~/.zshrc.minifast" ~/.zshrc)
    if [ -n "${ZSH_SOURCE_PATTERN}" ]
    then
      sed -i.bak '/source ~\\/.zshrc.minifast/d' ~/.zshrc
    fi
    rm -f ~/.zshrc.minifast
  SH

  installer script: "installer.sh"
  uninstall script: "uninstaller.sh"
end
