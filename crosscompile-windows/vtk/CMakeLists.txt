# CMake file for crosscompiling Maxima/wxMaxima for Windows
# Copyright (C) by Wolfgang Dautermann
# License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.

# If you want to use a updated version of a program,
# update the version number and the checksum.
# If no further patches are needed, you should get a
# updated setup-file automatically.

set(VTKVERSION  "6.3.0")

if(BUILD_64BIT)
    set(VTK_MD5           "c70ced791c09083a39866a76834fae60")
    set(VTK_INSTALLERNAME "vtkpython-${VTKVERSION}-Windows-64bit.exe")
else()
    set(VTK_MD5           "8d8b0878be81a0ab471e929f828dfe9a")
    set(VTK_INSTALLERNAME "vtkpython-${VTKVERSION}-Windows-32bit.exe")
endif()

set(VTK_URL       "http://www.vtk.org/files/release/6.3/${VTK_INSTALLERNAME}")

if(USE_VTK)
    externalproject_add(vtk
        URL "${VTK_URL}"
        DOWNLOAD_DIR ${CMAKE_SOURCE_DIR}/downloads
        DOWNLOAD_NO_EXTRACT 1
        URL_MD5 ${VTK_MD5}
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND ""
    )
    ExternalProject_Add_Step(vtk extract
        COMMENT "Performing extraction step for 'VTK'"
        COMMAND mkdir -p ${CMAKE_BINARY_DIR}/vtk && cd ${CMAKE_BINARY_DIR}/vtk && ${SEVENZIP_EXE} x -y ${CMAKE_SOURCE_DIR}/downloads/${VTK_INSTALLERNAME}
        DEPENDEES download
        DEPENDERS patch
    )
    install(DIRECTORY "${CMAKE_BINARY_DIR}/vtk/$_OUTDIR/bin/" DESTINATION vtk/ COMPONENT VTK)
endif()
