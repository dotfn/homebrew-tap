cask "brewmenu" do
  version "1.1.0"
  sha256 "dabcc96fe4b9f54af237f108dc35e95c48f3a1bce7b99e6f7b27492e0f592308"

  url "https://github.com/dotfn/brewmenu/releases/download/v#{version}/BrewMenu-#{version}.zip"
  name "BrewMenu"
  desc "Homebrew health monitor for macOS menu bar"
  homepage "https://github.com/dotfn/brewmenu"

  depends_on macos: :sonoma

  app "BrewMenu.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/BrewMenu.app"]
  end

  zap trash: [
    "~/Library/Application Support/BrewMenu",
    "~/Library/Preferences/com.brewmenu.app.plist",
  ]
end
