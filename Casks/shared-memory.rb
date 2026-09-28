cask "shared-memory" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/shared-memory.plist", __dir__)}"
  name "shared-memory"
  desc "Configure shared memory allocation"
  homepage ""

  stage_only true

  preflight_steps do
    launch_daemon_dir = Pathname.new("/Library/LaunchDaemons")
    run "sudo", args: ["ln", "-s", "{{staged_path}}/shared-memory.plist", launch_daemon_dir.join('shared-memory.plist')]
    run "sudo", args: ["chown", "root:wheel", launch_daemon_dir.join('shared-memory.plist')]
    run "sudo", args: ["launchctl", "load", "/Library/LaunchDaemons/shared-memory.plist"]
  end

  uninstall_preflight_steps do
    launch_daemon_dir = Pathname.new("/Library/LaunchDaemons")
    run "sudo", args: ["launchctl", "unload", "/Library/LaunchDaemons/shared-memory.plist"]
    run "sudo", args: ["rm", launch_daemon_dir.join('shared-memory.plist')]
  end
end
