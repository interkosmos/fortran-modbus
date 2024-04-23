! test_modbus.f90
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: modbus
    use :: modbus_tcp
    implicit none (type, external)

    type(c_ptr) :: mb

    print '("Version: ", i0, ".", i0, ".", i0)', LIBMODBUS_VERSION_MAJOR, &
                                                 LIBMODBUS_VERSION_MINOR, &
                                                 LIBMODBUS_VERSION_MICRO

    print '("Creating Modbus TCP context ...")'
    mb = modbus_new_tcp('127.0.0.1' // c_null_char, 1502)
    if (.not. c_associated(mb)) stop 'Error: modbus_new_tcp() failed'
    print '(a)', modbus_strerror(0)

    print '("Releasing Modbus TCP context ...")'
    call modbus_free(mb)
    if (c_associated(mb)) stop 'Error: modbus context is still associated (compiler bug)'
end program main
