cask "shared-memory" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/shared-memory.plist", __dir__)}"
  name "shared-memory"
  desc "Configure shared memory allocation"
  homepage ""

  stage_only true

  preflight_steps do
    symlink "shared-memory.plist", "/Library/LaunchDaemons/shared-memory.plist", sudo: true, source_base: :staged_path, remove_on_uninstall: true
    run "chown", args: ["root:wheel", "/Library/LaunchDaemons/shared-memory.plist"], sudo: true
    run "launchctl", args: ["load", "/Library/LaunchDaemons/shared-memory.plist"], sudo: true
  end

  uninstall_preflight_steps do
    run "launchctl", args: ["unload", "/Library/LaunchDaemons/shared-memory.plist"], sudo: true
  end
end
