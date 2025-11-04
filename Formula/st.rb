# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class St < Formula
  desc "A fast, simple TUI for interacting with systemd services and their logs"
  homepage "https://github.com/rust-kotlin/systemctl-tui"
  url "https://github.com/rust-kotlin/systemctl-tui/releases/download/v0.5.1/systemctl-tui-x86_64-unknown-linux-musl.tar.gz"
  sha256 "6969ceb62ad93c58583012d02172044e580626d9db54b2ac72f2725fde6da706"
  license "MIT"

  # depends_on "cmake" => :build

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://docs.brew.sh/rubydoc/Formula.html#std_configure_args-instance_method
    # system "./configure", "--disable-silent-rules", *std_configure_args
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "tar", "-xzvf", "systemctl-tui-x86_64-unknown-linux-musl.tar.gz"
    system "mv", "systemctl-tui", "st"
    bin.install "st"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test st`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "st -V"
  end
end
