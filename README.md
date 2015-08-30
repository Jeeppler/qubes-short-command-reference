# A short Qubes command reference

**The goal:** a command reference in one file, to be able to search fast for every command

This contains all VmTools and Dom0Tools commands for [Qubes OS](https://www.qubes-os.org/) in one file.
The command reference is automatically generated by the '[`create.sh`](https://github.com/Jeeppler/qubes-short-command-reference/blob/master/create.sh)' script.

## Downloads

- **PDF: [qubes-cheatsheet.pdf](https://github.com/Jeeppler/qubes-short-command-reference/raw/master/short-reference.pdf)**

- **HTML: [qubes-cheatsheet.html](https://github.com/Jeeppler/qubes-short-command-reference/raw/master/short-reference.html)**

- **Text: [qubes-cheatsheet.txt](https://github.com/Jeeppler/qubes-short-command-reference/raw/master/short-reference.txt)**

## Other formats

The PDF and HTML file is generated by using [Pandoc](http://pandoc.org/).

Pandoc can generate different files from one [markdown](http://daringfireball.net/projects/markdown/) text file.


```bash
# outputs a PDF file
pandoc short-reference.md -s -o short-reference.pdf

# outputs a HTML (HTML5) file
pandoc short-reference.md -s -S -t html5 -o short-reference.html

# outputs a plain text
pandoc short-reference.md -s -S -t plain -o short-reference.txt
```

`short-reference.md` is the input file and `short-reference.xxx` the output file.

Pandoc is furthermore able to generate files for asciidoc, odt, docx, textile and many more. Please have a look at [Pandoc Demos](http://pandoc.org/demos.html).
