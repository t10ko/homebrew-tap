cask "russian-pyramid" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.0"
  sha256 arm:   "99c21c7c94b5e29c8fb80a160fed66887c6375a5b3fd82f59360e360ec826a1b",
         intel: "12b98cf674b9aabe53ec07565debd90efd1c04e4b852053ba19e3ef23c4cbe39"

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
