cask "shared-memory" do
  version "1.0.0"
  sha256 ""

  url "file://#{File.expand_path("../files/shared-memory.plist", __dir__)}"
  name "shared-memory"
  desc "Configure shared memory allocation"
  homepage ""

  stage_only true

  preflight do
    launch_daemon_dir = Pathname.new("/Library/LaunchDaemons")
    system "sudo", "ln", "-s", staged_path.join('shared-memory.plist'), launch_daemon_dir.join('shared-memory.plist')
    system "sudo", "chown", "root:wheel", launch_daemon_dir.join('shared-memory.plist')
    system "sudo", "launchctl", "load", "/Library/LaunchDaemons/shared-memory.plist"
  end

  uninstall_preflight do
    launch_daemon_dir = Pathname.new("/Library/LaunchDaemons")
    system "sudo", "launchctl", "unload", "/Library/LaunchDaemons/shared-memory.plist"
    system "sudo", "rm", launch_daemon_dir.join('shared-memory.plist')
  end
end
