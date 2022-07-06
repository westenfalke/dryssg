---
title: dryssg 
---

## Static Site Generator

A static site generator with preprocessor to reduce the pain of creating new websites or updating a working one by automation.

## Blurb

To strike a balance between the automation of repetitive tasks and a fair amount of manual labor, this static website generator aims toward two goals:

### Machine-Readability

- `robots.txt` 
- `sitemap.xml`
- validated HTML (without broken references) 

### Simplicity (alias fewer features)

- reduce complexity
- increase reliability

This static website generator is based on `make`  and  the capability to manage dependencies. This is not about reinventing the wheel, so `GMSL` (GNUMAKE Standard Library) makes this `ssg` stand on the shoulders of giants, right from the start and `pandoc` (much more than an `*2html` converter) already makes this project feel like hitting the ground running.  And with  `remake`  and `GMSL` it is prepared to fail.

> The likeness of the build process of a website and a computer program seems obvious, once perceived. :wq

## Content

[TOC]

## Outline

### SMART Goals

- 2022-06 to browse the website locally, with a Browser and without the need for a webserver,
  all references are kept relative and the value of a `href` attribute has to address a **file** and not a directory. 
  @see `$(INDEXHTML)` will be a `<nullstring>` in stages like production.

  > BTW: this is also to avoid broken links and makes early link-checks cheap, easy and fast.

- 2022-06 `pandoc` is used to translate `markdown-files` into  `html-files`.

- 2022-06 each `html-file` in the `<document-root>` of the the website is generated from a corresponding `markdown-file` in a `<document-directory>`

- 2022-06 metadata and style are stored in YAML 

  - a declared value in a `yaml-header` overwrites all previews definitions and 

  - the `metadata.yaml` in a folder overwrites the definition in

  - the  `<config-folder>/metadata.yaml` for the whole website.

- 2022-07 source files are primarily written in `markdown`, 
  and as long as the `markdown-file` doesn't contain `HTML` the `yaml-header`  is optional.

- 2022-07 the values declared in `metadata.yaml` are applied only to `markdown-files` via `pandoc` with exceptions for

  -  drafting 2022-08

  - (un-)publish dates 2022-12
    


### Gallery

> 2022-07 Images: Yes there are images and there is already another `makefile` to create and maintain images and `metadata.yaml` in a gallery. 



## Dependencies

### Hard dependencies

an *ix OS and `bash` , `bulma <partially>`, `date`, `find`, `git`, `GMSL`, `make`. `pandoc`, `realpath`,`remake`, `rsync`, `sed`, `test`, `touch`

@see [Dockerfile](https://github.com/westenfalke/dryssg/blob/main/.devcontainer/Dockerfile)

### Soft dependencies

The tests, examples and documentation will use these tools for convenience's sake and will probably break without them:   

 `gh-cli`,  `FastStone Image Viewer`, `nginx`, `image magick`,  `sass-cli`, `Typora`, `WSL`
