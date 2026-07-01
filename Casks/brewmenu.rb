cask "brewmenu" do
  version "1.1.5"
  sha256 "e5984ebbdc0cfeb679552b7298a0d333249bc56481dae416a87e64bf56813640"

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

  uninstall quit: "com.brewmenu.app"

  zap trash: [
    "~/Library/Application Support/BrewMenu",
    "~/Library/Preferences/com.brewmenu.app.plist",
  ]
end
