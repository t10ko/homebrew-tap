cask "russian-pyramid" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.1"
  sha256 arm:   "99479ed27c57b7dcb12f2bac788cd17c855a041fc224610c0fea3506e6cf25af",
         intel: "0459bac6618ee6c222c7b3ee39dc35acc1d630a06a7d47b875cf36b6c069e35b"

  url "https://github.com/t10ko/russian-pyramid/releases/download/v#{version}/russian-pyramid-#{arch}.dmg"
  name "Russian Pyramid"
  desc "3D Russian Pyramid practice table with pooltool physics"
  homepage "https://github.com/t10ko/russian-pyramid"

  depends_on macos: :monterey

  app "Russian Pyramid.app"
  binary "#{appdir}/Russian Pyramid.app/Contents/MacOS/russian-pyramid"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Russian Pyramid.app"],
        must_succeed: false,
        print_stderr: false
  end
end
