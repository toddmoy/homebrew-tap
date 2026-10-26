# Template: the release workflow fills in the version and sha256 placeholders
# and pushes the result to toddmoy/homebrew-tap.
cask "sketchpad" do
  version "0.1.2"
  sha256 "1b1d6897c6bf931b20b624a653694f9bcb5502259d35bb38eb1f9f8bd5cd3df2"

  url "https://github.com/toddmoy/sketchpad/releases/download/v#{version}/Sketchpad.dmg"
  name "Sketchpad"
  desc "Menu bar sketchpad for handing drawings to LLMs"
  homepage "https://toddmoy.com/apps/sketchpad"

  depends_on macos: ">= :big_sur"

  app "Sketchpad.app"

  # The app isn't notarized, so clear the quarantine flag to let it open without a Gatekeeper block.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Sketchpad.app"]
  end

  zap trash: [
    "~/Library/Application Support/Sketchpad",
    "~/Library/Logs/Sketchpad",
  ]
end
