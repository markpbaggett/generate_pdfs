# Package

version       = "0.1.0"
author        = "Mark Baggett"
description   = "Tiny wrapper around imagemagick for generating pdfs"
license       = "WTFPL"
srcDir        = "src"
bin           = @["generate_pdfs"]



# Dependencies

requires "nim >= 1.0.6"
requires "nimoji >= 0.1.4"
requires "argparse >= 0.10.0"
