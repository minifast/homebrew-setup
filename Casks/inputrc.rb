cask "inputrc" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/inputrc", __dir__)}"
  name "inputrc"
  desc "Configure readline"
  homepage ""

  stage_only true

  preflight_steps do
    symlink "inputrc", ".inputrc", source_base: :source_base, target_base: :user
  end

  uninstall_preflight_steps do
    remove "{{user}}/.inputrc"
  end
end
