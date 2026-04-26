cask "tokenicode" do
  arch arm: "aarch64", intel: "x64"

  version "0.10.7"

  on_arm do
    sha256 "aeb48705667a92c84e9854e9731be25038ba039eb2833577f2ca6d66bb827a57"
  end

  on_intel do
    sha256 "0c25df1301e1447c2482e8b0c3bdccce57463a9882d20e8af59911e8668edecd"
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
