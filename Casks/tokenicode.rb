cask "tokenicode" do
  arch arm: "aarch64", intel: "x64"

  version "0.11.0"

  on_arm do
    sha256 "67e843e890a6b1e0f96c1227c5689e15ddd0fd2fbfe2bb501ac19ecef881363f"
  end

  on_intel do
    sha256 "dab3bb2df505ff4563e8f68436a1f3a684702d3e0a58a7c8ae3a1964a32d71b8"
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
