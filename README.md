# SIN Standard Library

The standard library functions for the [SIN programming language](https://github.com/rlannon/SINx86).

## Getting Started

In order to compile the SIN Standard Library, you will need working C and SIN compilers because this project utilizes a combination of both C and SIN. Some functions, such as various typecasting functions, utilize pure SIN, but many functions simply utilize SIN wrappers for C functions (such as `print`, `input`, etc.).

The Standard Library requires the [SIN Runtime Environment](https://github.com/rlannon/SRE), and utilizes a C header file to allow the project to be built. Like all other SIN projects, it is expected that the SRE will be linked with the project when the final project executable is built. These files may be compiled into object code without the SRE, but will not produce a working binary unless the SRE is present.

In order to use the standard library in a SIN project, just include the headers from `header` that you desire.

## What's Included

This project implements SIN's entire standard library and includes documentation for it in the event anyone would like to utilize their own implementation. It consists of a variety of functions that allow easier integration with the host environment. It is not required for a project to work (unlike the SRE), but makes the language a little richer and more full-featured.
