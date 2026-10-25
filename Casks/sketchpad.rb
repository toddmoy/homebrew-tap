# Template: the release workflow fills in 0.1.0 and 60da8baa65d075755d9ada938f60a01ae475ce29cd365a273ff88cea5e3e2742
# and pushes the result to toddmoy/homebrew-tap.
cask "sketchpad" do
  version "0.1.0"
  sha256 "60da8baa65d075755d9ada938f60a01ae475ce29cd365a273ff88cea5e3e2742"

  url "https://github.com/toddmoy/sketchpad/releases/download/v#{version}/Sketchpad-#{version}-universal.dmg"
  name "Sketchpad"
  desc "Menu bar sketchpad for handing drawings to LLMs"
  homepage "https://github.com/toddmoy/sketchpad"

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
