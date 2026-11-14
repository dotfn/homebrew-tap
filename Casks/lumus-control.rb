cask "lumus-control" do
  version "0.7.0"
  sha256 "8629c34599c3df262b8f007f4f9f76d4773a0cb71b7ce311527ef77ec70afd77"

  url "https://github.com/dotfn/lumus-control/releases/download/v#{version}/Lumus.Control_#{version}_aarch64.dmg",
      verified: "github.com/dotfn/lumus-control/"
  name "Lumus Control"
  desc "Local control panel for WiZ smart lamps over UDP"
  homepage "https://lumus-control.vercel.app"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Lumus Control.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Lumus Control.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.lumuscontrol.desktop",
    "~/Library/Caches/com.lumuscontrol.desktop",
    "~/Library/Logs/com.lumuscontrol.desktop",
    "~/Library/WebKit/com.lumuscontrol.desktop",
    "~/Library/Saved Application State/com.lumuscontrol.desktop.savedState",
  ]
end
