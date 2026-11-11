cask "dotphin" do
  version "0.1.2-beta"
  sha256 "230ac835a64c4784a0551acbd8603639936532232867dd5df9e13b71eec4bbed"

  url "https://github.com/dotfn/dotphin/releases/download/v#{version}/Dotphin-#{version}.zip"
  name "Dotphin"
  desc "File manager inspired by KDE Dolphin"
  homepage "https://github.com/dotfn/dotphin"

  # Tags carry a pre-release suffix (v0.1.0-beta), which the default regex drops.
  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:-[\w.]+)?)$/i)
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Dotphin.app"

  # Not notarized yet: clear the download quarantine so Gatekeeper lets it open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Dotphin.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.dotphin.app.plist",
    "~/Library/Saved Application State/com.dotphin.app.savedState",
  ]
end
