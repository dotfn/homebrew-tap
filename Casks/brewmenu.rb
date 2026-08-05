cask "brewmenu" do
  version "1.2.8"
  sha256 "e8e2fea72342a9bf67804a242b9cd2340a3049ac888a5b636c4cb9b8e70abf6f"

  url "https://github.com/dotfn/brewmenu/releases/download/v#{version}/BrewMenu-#{version}.zip"
  name "BrewMenu"
  desc "Homebrew health monitor for macOS menu bar"
  homepage "https://github.com/dotfn/brewmenu"

  depends_on macos: :sequoia

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
