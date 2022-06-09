---
title: dryssg 
---

## Static Site Generator

A static site generator with preprocessor to reduce the pain from creating new or updating a working websites by automation and the fearless competence of its end-users. 

## BLURB

This static website generator aims toward two targets. 

The easy part is, to be Machine readable: starting with `robots.txt`, `sitemap.xml`, validated HTML and without broken references. 

The hard part is, to reduce complexity and increase reliability and therefore strike balance between the automation of repetitive task and a fair amount of manual manual labor.            

The likeliness of the build process of a website and a computer program seems obvious, once perceived. 

Hence this static website generator will make use of  `make` , there has to be an adequate (not equivalent) replacement for a dependency manager, a linker and the compiler and so on. (pun intended) such as  `make` ,`GMSL` and `pandoc`.

## Content

[TOC]

## Outline

### Dataflow

- To browse the website locally, with a Browser and whiteout the need of a webserver,
  all references are keep relative and the values of `href` attribute has to address a **file** and not a directory. 
  @see `$(INDEXHTML)` will be a `<nullstring>` in stages like production.

  > BTW: this is also to avoid broken links and makes early link-checks cheep, easy and fast.

- `pandoc` is used to translate `markdown-files` into  `html-files`.

- Each `html-file` in the `<document-root>` of the the website is generated from a corresponding `markdown-file` in a `<document-directory>`

- Metadata and style are store in YAML 

  - were a declared value in a `yaml-header` overwrites all previews definitions and 

  - the `metadata.yaml` in a folder overwrites the definition in

  - the  `<config-folder>/metadata.yaml` for the whole website.

- Source files are primarily to by written in `markdown`, 
  and as long as the `markdown-file` doesn't contain `HTML` the `yaml-header`  is optional.

- The values declared in `metadata.yaml` are applied only to `markdown-files` via `pandoc`.

### Gallery

> Images: Yes the are images and there is already another `makefile` to crate and maintain images and `metadata.yaml` in a gallery. 



## Dependencies

### Hard dependencies

an *ix OS and `bash` , `bulma`, `date`, `find`, `git`, `GMSL`,  `pandoc`, `realpath`, `rsync`, `sed`, `test`, `touch`

### Soft dependencies

The tests, examples and documentation will use this tools for convenience sake and will probably break without.   

 `gh-cli`,  `FastStone Image Viewer,` `image magick`,  `sass-cli`, `Typora`, `WSL`



## 
