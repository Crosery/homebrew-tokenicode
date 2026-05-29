cask "tokenicode" do
  arch arm: "aarch64", intel: "x64"

  version "0.10.8"

  on_arm do
    sha256 "54bc1ee5e28eedfb24b285b69f90c7ad485f24fa48d03798056f33e8d0e8cc3b"
  end

  on_intel do
    sha256 "83ec64ecf57aa3ad144c643ebe82e39b07fcbc9086d16af465612878a71984d4"
  end

  url "https://github.com/yiliqi78/TOKENICODE/releases/download/v#{version}/TOKENICODE_#{version}_#{arch}.dmg"
  name "TOKENICODE"
  desc "Desktop client for Claude Code"
  homepage "https://github.com/yiliqi78/TOKENICODE"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "TOKENICODE.app"

  zap trash: [
    "~/Library/Application Support/TOKENICODE",
    "~/Library/Caches/TOKENICODE",
    "~/Library/Preferences/com.tokenicode.app.plist",
    "~/Library/Saved Application State/com.tokenicode.app.savedState",
  ]
end
