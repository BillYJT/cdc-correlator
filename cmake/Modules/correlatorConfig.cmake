INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_CORRELATOR correlator)

FIND_PATH(
    CORRELATOR_INCLUDE_DIRS
    NAMES correlator/api.h
    HINTS $ENV{CORRELATOR_DIR}/include
        ${PC_CORRELATOR_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    CORRELATOR_LIBRARIES
    NAMES gnuradio-correlator
    HINTS $ENV{CORRELATOR_DIR}/lib
        ${PC_CORRELATOR_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/correlatorTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(CORRELATOR DEFAULT_MSG CORRELATOR_LIBRARIES CORRELATOR_INCLUDE_DIRS)
MARK_AS_ADVANCED(CORRELATOR_LIBRARIES CORRELATOR_INCLUDE_DIRS)
