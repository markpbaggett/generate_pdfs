import osproc, strformat, os, strutils, nimoji, random, argparse

proc get_a_book_emoji(): string =
  let 
    books = [":notebook_with_decorative_cover:", ":notebook:", ":blue_book:", ":orange_book:", ":green_book:", ":closed_book:"]
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
  var
    p = newParser(fmt"Harvest  OAI Records"):
      option("-d", "--directory", help="The directory you want to get your books from.")
      option("-q", "--quality", help="Specify the quality of your output PDF.", default="70")
      option("-o", "--output", help="Specify your output directory.")
    argv = commandLineParams()
    opts = p.parse(argv)
  if opts.directory != "" and opts.output != "":
    discard generate_pdf(get_directory(opts.directory), opts.quality, opts.output)
  else:
    echo "Must supply an input directory and an output directory."