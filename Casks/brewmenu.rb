cask "brewmenu" do
  version "1.2.7"
  sha256 "adc6534da2717e53e00b151b92a6b1c08468224ea2b8d63cbebd714a3e91a773"

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
