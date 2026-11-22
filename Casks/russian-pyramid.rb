cask "russian-pyramid" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.0"
  sha256 arm:   "dacea425a4e48a685b98a5976051e08b3d541492b91bb063d44c4b6eaa7fd8fc",
         intel: "d72200535847c091be3fc467fe1c1a3f34a480a783f99f91f6ce7eb5d021b745"

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
