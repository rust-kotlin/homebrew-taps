cask "ashell" do
  version "0.4.7"

  on_arm do
    sha256 "0c8af2215783a404f4d3c7bc89cab1696d04bb938f31d31ea9d252c31c790ffb"
    url "https://github.com/rust-kotlin/ashell/releases/download/v#{version}/ashell-v#{version}-macos-aarch64.zip"
  end
  on_intel do
    sha256 "2bc19a226377d4bd9eb39e8528591c1075f423d0050920633164c1e390579d3d"
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
    ashell uses ad-hoc signing. The installation includes a postflight script
    that removes the 'com.apple.quarantine' attribute from the application
    to allow it to run. This will require your administrator password.

    ashell 采用本地签名。安装程序包含一个后置脚本，用于移除应用程序的
    'com.apple.quarantine' 属性以允许其运行。这需要您的管理员密码。
  EOS
end
