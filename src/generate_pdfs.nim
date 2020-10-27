import osproc, strformat, os, strutils, nimoji, random

proc get_a_book_emoji(): string =
  let 
    books = [":book:", ":notebook:", ":blue_book:", ":orange_book:", ":green_book:", ":closed_book:"]
  sample(books)

proc get_directory(directory: string): seq[string] =
  for kind, path in walkDir(directory):
    if kind == pcDir:
      result.add(path)

proc generate_pdf(directories: seq[string], quality, output_directory: string): int =
  for directory in directories:
    let
      last = directory.split("/")[^1]
      my_command = fmt"convert {directory}/*.tif -compress jpeg -quality {quality} {output_directory}/{last}.pdf"
    echo fmt"{'\n'}Generating PDF for {last}. {get_a_book_emoji()} {'\n'}".emojize
    discard execShellCmd(my_command)

when isMainModule:
  discard generate_pdf(get_directory("/home/mark/nim_projects/generate_pdfs/sample_data/"), "80", "test")