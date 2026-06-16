cask "ashell" do
  version "0.4.5-rc.2"
  
  on_arm do
    sha256 "708ca741cd739255f379a6fa08088a11bff1ceac535c2e19f8f0c71b33f53fc3"
    url "https://github.com/rust-kotlin/ashell/releases/download/v#{version}/ashell-v#{version}-macos-aarch64.zip"
  end
  on_intel do
    sha256 "32d7b1ee11881cfbbbbca64daed486f816030de6543547b946ba290e8a07ee8e"
    url "https://github.com/rust-kotlin/ashell/releases/download/v#{version}/ashell-v#{version}-macos-x86_64.zip"
  end

  name "ashell"
  desc "ashell is a modern, fast, GPUI Component-based desktop terminal client written in Rust."
  homepage "https://github.com/rust-kotlin/ashell"

  app "ashell.app"

  postflight do
    puts "Removing quarantine flag from ashell.app..."
    system_command "/usr/bin/xattr",
         args: ["-rd", "com.apple.quarantine", "#{appdir}/ashell.app"],
         sudo: true
  end

  caveats <<~EOS
    ashell is not notarized. The installation includes a postflight script
    that removes the 'com.apple.quarantine' attribute from the application
    to allow it to run. This will require your administrator password.
  EOS
end
