cask "brewmenu" do
  version "1.0.0"
  sha256 "39fdcd4e821106a65ea5372db5ae976f63014da1e11dc2573a7759d8d4995310"

  url "https://github.com/dotfn/brewmenu/releases/download/v#{version}/BrewMenu-#{version}.zip"
  name "BrewMenu"
  desc "Homebrew health monitor for macOS menu bar"
  homepage "https://github.com/dotfn/brewmenu"

  depends_on macos: ">= :sonoma"

  app "BrewMenu.app"

  zap trash: [
    "~/Library/Application Support/BrewMenu",
    "~/Library/Preferences/com.brewmenu.app.plist",
  ]
end
