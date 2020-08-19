# SIN Standard Library

## Standard I/O with `stdio`

The `stdio` module serves the same purpose of the C standard library header of the same name -- it provides input and output functionality and integration with the host environment. This includes the following functionality:

### `void print(string s)`

Prints the supplied string to the standard output. In this implementation, it is simply a SIN wrapper to the C function `printf`.

### `final string input()`

Fetches input from the standard input up to a newline character and returns the string. The string that is returned may not be modified as it is marked `final`. The returned string will be located in a dynamically-allocated buffer.
