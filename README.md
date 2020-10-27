# Generate PDFS with ImageMagick

A small, C compiled binary for generating PDFs with ImageMagick so that I don't have to think about sed and awk

## Examples


### Required:

```
./generate_pdfs -d /path/to/my/directory/with/tiffs -o /path/to/where/to/store/my/generated/pdfs
```

### Optionally, include quality:

```
./generate_pdfs -d /path/to/my/directory/with/tiffs -o /path/to/where/to/store/my/generated/pdfs -q 100
```
