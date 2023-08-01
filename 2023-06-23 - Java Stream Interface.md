---
title: Java Stream Interface
date: 2023-06-23
tags: java
---
[Streams](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/stream/package-summary.html) in Java are a way to lazily consume a possibly infinite amount of data in memory sequentially or, in some cases, even in parallel.

Streams are consumed in [stream pipelines](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/stream/package-summary.html#StreamOps), which are composed by:
1. a *source*;
2. 0 or more *intermediate operations*;
3. a *terminal* operation.

The *source* could be, to give a few examples, a [`Collection`](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/Collection.html), an [`Array`](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/reflect/Array.html) or even an I/O channel. These are typically consumed sequentially.

The *intermediate operations*, like [`filter()`](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/stream/Stream.html#filter(java.util.function.Predicate)) or [`.map()`](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/stream/Stream.html#map(java.util.function.Function)), always return a new stream and are lazy, that is, they are executed only when the terminal operation is invoked, so the traversal only happens at the end - not for each operation.

*Terminal* operations, such as [`forEach()`](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/stream/Stream.html#forEach(java.util.function.Consumer)) or [`findFirst()`](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/stream/Stream.html#findFirst()), trigger the consume of the stream. These are optimized to execute the fewer possible operations, as an example, the `findFirst()` terminal will only process the first item in the stream.

Once the stream is consumed, it can't be used anymore, and a new one must be created starting from the *source*.

A few key notes:
- Try to use stateless operations as they remove the possibility of having nondeterministic or wrong output;
- Prefer a reduce operation over a for loop to have easy access to parallelization as long as the operations are [stateless](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/stream/package-summary.html#Statelessness) and [associative](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/stream/package-summary.html#Associativity);

Source: https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/stream/package-summary.html