cask "ashell" do
  version "0.5.2"

  on_arm do
    sha256 "86c82f87ea79a3cdcca88e145ab5044b37fe1bcb27358e0a05965afdc88923c1"
    url "https://github.com/rust-kotlin/ashell/releases/download/v#{version}/ashell-v#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "8de3ab5190fe2b75011d853ffed83aa43bd69daf9cb6048ef8a799603d6fef33"
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
