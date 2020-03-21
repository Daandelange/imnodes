cmake_minimum_required(VERSION 3.14)

project ( imnodes )

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package ( OpenGL REQUIRED )

if (WIN32)
  find_package ( SDL )
  include_directories (
    ${SDL_INCLUDE_DIR}
  )
  set(sdl_link_library ${SDL_LIBRARY})
else()
  find_package ( SDL2 )
  include_directories (
    ${SDL2_INCLUDE_DIRS}
  )
  set(sdl_link_library SDL2)
endif()

include_directories (
  gl3w/include
  imgui
  .
  )

add_library ( gl3w STATIC
  gl3w/src/gl3w.c
  )

add_library ( imgui STATIC
  imgui/imgui.cpp
  imgui/imgui_draw.cpp
  imgui/imgui_impl_opengl3.cpp
  imgui/imgui_impl_sdl.cpp
  imgui/imgui_widgets.cpp
  )

add_library ( imnodes STATIC
  imnodes.cpp
  )

set ( imnodes_link_libraries
  ${sdl_link_library}
  gl3w
  imgui
  imnodes
  ${OPENGL_gl_LIBRARY}
  ${OPENGL_glu_LIBRARY}
  ${CMAKE_DL_LIBS}
  )

add_executable ( color_node_editor WIN32
  example/color_node_editor.cpp
  example/main.cpp
  )

add_executable ( multi_editor WIN32
  example/multi_editor.cpp
  example/main.cpp
  )

add_executable ( save_load WIN32
  example/save_load.cpp
  example/main.cpp
  )

add_executable ( simple WIN32
  example/simple.cpp
  example/main.cpp
  )

target_link_libraries ( color_node_editor
  ${imnodes_link_libraries}
  )

target_link_libraries ( multi_editor
  ${imnodes_link_libraries}
  )

target_link_libraries ( save_load
  ${imnodes_link_libraries}
  )

target_link_libraries ( simple
  ${imnodes_link_libraries}
  )

install ( TARGETS
  gl3w
  imgui
  imnodes
  DESTINATION
  lib
  )

install ( FILES
  imnodes.h
  DESTINATION
  include/imnodes
  )

install ( FILES
  imgui/imconfig.h
  imgui/imgui.h
  imgui/imgui_impl_opengl3.h
  imgui/imgui_impl_sdl.h
  imgui/imgui_internal.h
  imgui/imstb_rectpack.h
  imgui/imstb_textedit.h
  imgui/imstb_truetype.h
  DESTINATION
  include/imgui
  )

install ( FILES
  gl3w/include/GL/gl3w.h
  gl3w/include/GL/glcorearb.h
  DESTINATION
  include/gl3w/GL
  )
