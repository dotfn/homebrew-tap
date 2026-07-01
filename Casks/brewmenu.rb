cask "brewmenu" do
  version "1.0.0"
  sha256 "bd6c3280a72bf0b65f2e8ad325a5a6454f7ad8b2c0188fb38adb066c91240ba0"

  url "https://github.com/dotfn/brewmenu/releases/download/v#{version}/BrewMenu-#{version}.zip"
  name "BrewMenu"
  desc "Homebrew health monitor for macOS menu bar"
  homepage "https://github.com/dotfn/brewmenu"

  depends_on macos: :sonoma

  app "BrewMenu.app"

  zap trash: [
    "~/Library/Application Support/BrewMenu",
    "~/Library/Preferences/com.brewmenu.app.plist",
  ]

  caveats <<~EOS
    BrewMenu is not notarized by Apple. If macOS blocks the app on first launch:

      System Settings → Privacy & Security -> "Open Anyway"

    Or via Terminal:
      sudo xattr -rd com.apple.quarantine /Applications/BrewMenu.app
  EOS
end
