cask "tokenicode" do
  arch arm: "aarch64", intel: "x64"

  version "0.10.6"

  on_arm do
    sha256 "e49f7f0dd52713c2f683dfef7141a613c6b4b39cf8a4b4d0aaf01897028815f4"
  end

  on_intel do
    sha256 "6d5bc05d25371dc6567a1dceb704eb0e4ab79becf5e526afcb6efefbfef83699"
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
