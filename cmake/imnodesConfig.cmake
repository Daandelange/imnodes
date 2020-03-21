find_package ( PackageHandleStandardArgs )
include(CMakePackageConfigHelpers)

find_path( IMNODES_LOCATION include/imnodes/imnodes.h
  "$ENV{IMNODES_HOME}"
  NO_DEFAULT_PATH
  NO_SYSTEM_ENVIRONMENT_PATH
  )

find_package_handle_standard_args ( imnodes
  REQUIRED_VARS IMNODES_LOCATION
  )

if ( IMNODES_FOUND )
  list(APPEND _IMNODES_INCLUDE_DIRS "${IMNODES_LOCATION}/include/imgui")
  list(APPEND _IMNODES_INCLUDE_DIRS "${IMNODES_LOCATION}/include/gl3w")
  list(APPEND _IMNODES_INCLUDE_DIRS "${IMNODES_LOCATION}/include/imnodes")
  set(IMNODES_INCLUDE_DIRS ${_IMNODES_INCLUDE_DIRS} CACHE STRING "imnodes include directories")
  #message( "IMNODES_LOCATION = ${IMNODES_LOCATION}" )
  #message( "IMNODES_INCLUDE_DIRS = ${IMNODES_INCLUDE_DIRS}" )
  find_library ( IMNODES_gl3w_LIBRARY
	gl3w PATHS
    ${IMNODES_LOCATION}/lib
    )
  find_library ( IMNODES_imgui_LIBRARY
	imgui PATHS
    ${IMNODES_LOCATION}/lib
    )
  find_library ( IMNODES_imnodes_LIBRARY
	imnodes PATHS
    ${IMNODES_LOCATION}/lib
    )
  list(APPEND _IMNODES_LIBRARIES "${IMNODES_gl3w_LIBRARY}")
  list(APPEND _IMNODES_LIBRARIES "${IMNODES_imgui_LIBRARY}")
  list(APPEND _IMNODES_LIBRARIES "${IMNODES_imnodes_LIBRARY}")
  set(IMNODES_LIBRARIES ${_IMNODES_LIBRARIES} CACHE STRING "imnodes link libraries")
else ()
  message( FATAL " IMNODES_HOME = $ENV{IMNODES_HOME}" )
endif()
