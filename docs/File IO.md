# SIN Standard Library

## File I/O

The `file` module provides the capacity for file I/O through a few functions and a `struct` type.

### `struct file`

The fundamental file structure. This is used to contain file information and in all of the file I/O functions.

### `ptr<file> open_file(string name)`

Opens a file with the specified name, returning a pointer to the file structure that contains it. If no such file can be found, returns `null`.

### `void close_file(ptr<file> f)`

Closes the file in question. The data at the file is overwritten as `null`.

### `ptr<file> create_file(string name, unsigned long int init_size)`

Creates a new file with the specified name, returning a pointer to the file structure that contains it. If the file could not be created, returns `null`.

### `bool write(ref<file> f, ref<array<byte>> data, bool include_length: false)`

Writes the specified array of data to the file, excluding the array length byte if `include_legnth` is not set. The function returns whether it could successfully write to the file, returning `false` if it couldn't.

### `unsigned int read(ref<file> f, ref<array<byte>> dest, int len &unsigned)`

Reads `len` bytes from the specified file into the specified destination. If the array at the destination is too short for the bytes read in, bytes are copied to the end of the array and the copy stops. The function returns how many bytes were actually written, which is, at most, `dest:len`.
