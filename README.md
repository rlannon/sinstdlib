# SIN Standard Library

The standard library functions for the [SIN programming language](https://github.com/rlannon/SINx86).

## Getting Started

In order to compile the SIN Standard Library, you will need working C and SIN compilers because this project utilizes a combination of both C and SIN. Some functions, such as various typecasting functions, utilize pure SIN, but many functions simply utilize SIN wrappers for C functions (such as `print`, `input`, etc.).

The Standard Library requires the [SIN Runtime Environment](https://github.com/rlannon/SRE), and utilizes a C header file to allow the project to be built. Like all other SIN projects, it is expected that the SRE will be linked with the project when the final project executable is built. These files may be compiled into object code without the SRE, but will not produce a working binary unless the SRE is present.

In order to use the standard library in a SIN project, just include the headers from `header` that you desire.

## What's Included

This project implements SIN's entire standard library and includes documentation for it in the event anyone would like to utilize their own implementation. It consists of a variety of functions that allow easier integration with the host environment. It is not required for a project to work (unlike the SRE), but makes the language a little richer and more full-featured.

### `widths`

The widths module is pretty simple; it contains named constants with the widths of each SIN data type.

### Standard I/O with `stdio`

The `stdio` module serves the same purpose of the C standard library header of the same name -- it provides input and output functionality and integration with the host environment. This includes the following functionality:

#### `void print(string s)`

Prints the supplied string to the standard output. In this implementation, it is simply a SIN wrapper to the C function `printf`.

#### `final string input()`

Fetches input from the standard input up to a newline character and returns the string. The string that is returned may not be modified as it is marked `final`. The returned string will always be contained in the string buffer.

### File I/O with `stdio`

The `stdio` module also provides the capacity for file I/O through a few functions and a `struct` type.

#### `struct file`

The fundamental file structure. This is used to contain file information and in all of the file I/O functions.

#### `ptr<file> open_file(string name)`

Opens a file with the specified name, returning a pointer to the file structure that contains it. If no such file can be found, returns `null`.

#### `ptr<file> create_file(string name)`

Creates a new file with the specified name, returning a pointer to the file structure that contains it. If the file could not be created, returns `null`.

#### `bool write(ptr<file> f, ptr<array<byte>> data, bool include_length: false)`

Writes the specified array of data to the file, excluding the array length byte if `include_legnth` is not set. The function returns whether it could successfully write to the file, returning `false` if it couldn't.

#### `unsigned int read(ptr<file> f, ptr<array<byte>> dest, int len &unsigned)`

Reads `len` from the specified file into the specified destination. If the array at the destination is too short for the bytes read in, bytes are copied to the end of the array and the copy stops. The function returns how many bytes were actually written, which is, at most, `dest:len`.
