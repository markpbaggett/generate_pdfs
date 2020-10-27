import osproc, strformat, os, strutils

proc get_directory(directory: string): seq[string] =
  for kind, path in walkDir(directory):
    if kind == pcDir:
      result.add(path)
      echo path

proc generate_pdf(directories: seq[string], quality, output_directory: string): int =
  echo directories
  for directory in directories:
    let last = directory.split("/")[^1]
    let my_command = fmt"convert {directory}/*.tif -compress jpeg -quality {quality} {output_directory}/{last}.pdf"
    discard execShellCmd(my_command)

when isMainModule:
  discard generate_pdf(get_directory("/home/mark/nim_projects/generate_pdfs/sample_data/"), "80", "test")