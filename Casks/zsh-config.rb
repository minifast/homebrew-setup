cask "zsh-config" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/zshrc", __dir__)}"
  name "zsh-config"
  desc "Configure zsh"
  homepage ""

  stage_only true

  preflight_steps do
    symlink "zshrc", ".zshrc.minifast", source_base: :source_base, target_base: :user
    write_file ".zshrc", "source .zshrc.minifast", base: :user, overwrite: false, append_newline: true
  end

  uninstall_preflight_steps do
    inreplace ".zshrc", "source .zshrc.minifast\n", ""
    remove "{{user}}/.zshrc.minifast"
  end
end
