cask "mosaic" do
  version "1.0.2"
  sha256 "41c4afa74208aeb48767683be0b2a3965b3021bb0b950d5f063b6d8209f3fcb1"

  url "https://github.com/onsi/mosaic/releases/download/v#{version}/Mosaic.app.zip"
  name "Mosaic"
  desc "A fork of Rectangle that acts like ShiftIt"
  homepage "https://github.com/onsi/mosaic"

  app "Mosaic.app"
end
