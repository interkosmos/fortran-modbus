# fortran-modbus

A collection of Fortran 2018 interface bindings to
[libmodbus](https://github.com/stephane/libmodbus).

## Build Instructions

The package _libmodbus_ has to be installed with development headers. On
FreeBSD, run:

```
# pkg install comms/libmodbus
```

On Linux, instead:

```
# apt-get install libmodbus5 libmodbus-dev
```

Build and install the Fortran library using the provided Makefile:

```
$ make
$ make install PREFIX=/opt
```

Link your programs against `/opt/lib/libfortran-modbus.a -lmodbus`. Optionally,
overwrite the default compiler and the compiler flags:

```
$ make FC=ifx FFLAGS="-O3"
```

Or, use the [Fortran Package Manager](https://github.com/fortran-lang/fpm):

```
$ fpm build --profile release
```

Build and run the test program:

```
$ make test
$ ./test_modbus
```
## Fortran Package Manager

You can add *fortran-modbus* as an FPM dependency:

```toml
[dependencies]
fortran-modbus = { git = "https://github.com/interkosmos/fortran-modbus.git" }
```

## Licence

ISC
