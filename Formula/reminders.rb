class Reminders < Formula
  desc "Fast CLI for Apple Reminders on macOS"
  homepage "https://github.com/henrisaksi/reminders"
  url "https://github.com/henrisaksi/reminders/archive/refs/tags/1.0.0.tar.gz"
  sha256 "bbbd2ba577183ec024143e94e4685049b10907a9f73755ed86db762e60077e07"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/reminders"
  end

  test do
    system "#{bin}/reminders", "--help"
  end
end
