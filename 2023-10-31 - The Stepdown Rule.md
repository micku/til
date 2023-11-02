---
title: The Stepdown Rule
date: 2023-10-31
tags:
  - coding
---
Code files (or classes) should contain well organized functions (or methods) from top to bottom for better code readability.

This means that first should there be the more abstract function/method followed by lower level blocks.

This does not mean that we should *group* by abstraction level. If more than one function has a high level of abstraction, and each of those require the use of lower level functions, the first one should be either of the higher level, followed by those referenced in it.
Achieving this may require some thought for getting the correct order, one must not be lazy in this context.

This is because, as [Uncle Bob Martin](http://cleancoder.com/products) states in [Clean Code](https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882), expectation when reading good code is like reading a newspaper, it first briefly introduces the topic, and then goes into detail.

Source: https://dzone.com/articles/the-stepdown-rule
