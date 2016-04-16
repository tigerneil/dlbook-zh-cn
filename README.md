Deep Learning Book
==================

**This is a skeleton for Deep Learning Book Chinese Version.**

## Compile the LaTeX Source Code

To compile the source code to a PDF file, please make sure you have a latest TeX
system installed. You can download and install a TeX distribution for your
platform from http://tug.org.

It's recommended to install
- [Tex Live](http://tug.org/texlive/) 2015 or later for Linux
- [MacTex](http://tug.org/mactex/) 2015 or later for Mac OS X

Also, please make sure you have these font packages installed: `roboto`,
`sourcecodepro`, `sourceserifpro`, as these fonts are required in typesetting. You can install them
with `tlmgr` command.

**Note:** If your TeX system is not installed in the default `/usr/local`, you need to change the `fontdir` macro in `dlbook.tex`, default is:

```shell
\newcommand{\fontdir}[0]{/usr/local/texlive/2015/texmf-dist/fonts/}
```

### Check out source code

Use git to clone this repository and the code samples as a sub module:

```shell
$ git clone --recursive https://github.com/zhanggyb/dlbook.git
````

or
```shell
$ git clone https://github.com/tigerneil/dlbook-zh-cn.git
$ cd dlbook
$ git submodule update --init --recursive
````

### Prepare Fonts

Run the `bootstrap.sh` in the working copy to download CJK fonts required:

``` shell
$ ./bootstrap.sh
```

This is a simple shell script to download Google Noto CJK SC into `fonts/`. You
can also manually download the
[font file](https://noto-website-2.storage.googleapis.com/pkgs/NotoSansCJKsc-hinted.zip)
and unarchive to `fonts/`.

### Generate PDF

Run

``` shell
$ make
```

to typeset and generate the PDF document. Or use your favorite GUI TeX
application, but choose XeLaTeX as the typeset engine to support the chinese
fonts.
# dlbook-zh-cn
