cask "lidlit" do
  version "1.1"
  sha256 "0da95c18268ee2e85fb4d5da4545049c7d1f00cc8a27aa79e9366ac369db393c"

  url "https://github.com/Lafsen/lidlit-site/releases/download/v#{version}/Lidlit-#{version}.dmg"
  name "Lidlit"
  desc "Control the lit Apple logo on the lid of a MacBook Pro XDR"
  homepage "https://lidlit.app/"

  livecheck do
    url "https://lidlit.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Lidlit.app"

  uninstall quit: "com.eliasgrondal.lidlit"

  zap trash: [
    "~/.local/bin/lidlit",
    "~/Library/Caches/com.eliasgrondal.lidlit",
    "~/Library/HTTPStorages/com.eliasgrondal.lidlit",
    "~/Library/Preferences/com.eliasgrondal.lidlit.plist",
  ]
end
