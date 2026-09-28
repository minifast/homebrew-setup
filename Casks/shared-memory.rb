cask "shared-memory" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/shared-memory.plist", __dir__)}"
  name "shared-memory"
  desc "Configure shared memory allocation"
  homepage ""

  stage_only true

  preflight_steps do
    symlink "shared-memory.plist", "shared-memory.plist", source_base: :source_base, target_base: "/Library/LaunchDaemons"
    set_ownership "shared-memory.plist", user: "root", group: "wheel", base: "/Library/LaunchDaemons"
    run "sudo", args: ["launchctl", "load", "/Library/LaunchDaemons/shared-memory.plist"]
  end

  uninstall_preflight_steps do
    run "sudo", args: ["launchctl", "unload", "/Library/LaunchDaemons/shared-memory.plist"]
    remove "shared-memory.plist", base: "/Library/LaunchDaemons"
  end
end
