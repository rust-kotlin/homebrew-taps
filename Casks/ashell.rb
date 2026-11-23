cask "ashell" do
  version "0.5.3"

  on_arm do
    sha256 "0c83de46277fad469b57f7bd89f50224af585986604cf604223b82dbbf2d2fcd"
    url "https://github.com/rust-kotlin/ashell/releases/download/v#{version}/ashell-v#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "a4897e80d2fd3a1465847f51e31d501355f9d920355acaacba0260fc296b7f5f"
    url "https://github.com/rust-kotlin/ashell/releases/download/v#{version}/ashell-v#{version}-macos-x64.dmg"
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
