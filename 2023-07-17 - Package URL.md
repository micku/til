---
title: Package URL
date: 2023-07-17
tags: standards
---
While configuring my Neovim configuration for Java, I had to enter into details of how [mason.nvim](https://github.com/williamboman/mason.nvim) works, specifically how it maintains the list of packages and how do they download the required executables.

This is how I reached the [package URL spec repo](https://github.com/package-url/purl-spec), which is an effort to standardize package URLs:

> A minimal specification and implementation of purl aka. a Package "mostly universal" URL.

Basically, a URL that should uniquely identify a package in their distribution system:
```
scheme:type/namespace/name@version?qualifiers#subpath
```

An example for a Maven package is:
```
pkg:maven/com.puppycrawl.tools/checkstyle@10.12.1?type=jar
```

Github releases:
```
pkg:github/checkstyle/checkstyle@checkstyle-10.12.1
```

This is extremely useful when working with generic implementations that rely on external tools such as linters, formatters, LSPs or the like in the context of a text editor.

Source: [https://github.com/package-url/purl-spec](https://github.com/package-url/purl-spec)