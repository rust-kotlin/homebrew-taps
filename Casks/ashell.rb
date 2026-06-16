cask "ashell" do
  version "0.4.5-rc.1"
  
  on_arm do
    sha256 "496ac10013fe2b5e22ff9d1c38f02b0978a75b1dd29bdd25cd066daf91b4d560"
    url "https://github.com/rust-kotlin/ashell/releases/download/v#{version}/ashell-#{version}-macos-aarch64.zip"
  end
  on_intel do
    sha256 "06daa7eef2044885f8090d3fe055bfa5aeb35231f415e059533ac08fb80ebc06"
    url "https://github.com/rust-kotlin/ashell/releases/download/v#{version}/ashell-#{version}-macos-x86_64.zip"
  end

  name "ashell"
  desc "ashell is a modern, fast, GPUI Component-based desktop terminal client written in Rust."
  homepage "https://github.com/rust-kotlin/ashell"

  app "ashell.app"
end
