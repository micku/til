---
title: The Stepdown Rule
date: 2023-10-31
tags:
  - coding
---
Functions should be organized for better code readability.

This means that, in the same source file, first you want the more abstract functions followed by lower level code.

This does not mean that we should *group* by abstraction level, we should still group by reference. If more than one function has a high level of abstraction, and each of those require the use of lower level functions, the first one should be either of the higher level, followed by those referenced in it.

This is because:

- It is more convenient starting to read from a high level of abstraction and then go into details;
- No one reads code blocks by similarity, everyone follows the logic.

Source: https://dzone.com/articles/the-stepdown-rule
