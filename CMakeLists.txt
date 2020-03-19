cmake_minimum_required(VERSION 3.15)

project ( imnodes )

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package ( SDL2 )

include_directories (
  ${SDL2_INCLUDE_DIRS}
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
  SDL2
  gl3w
  imgui
  imnodes
  ${CMAKE_DL_LIBS}
  )

add_executable ( color_node_editor
  example/color_node_editor.cpp
  example/main.cpp
  )

add_executable ( multi_editor
  example/multi_editor.cpp
  example/main.cpp
  )

add_executable ( save_load
  example/save_load.cpp
  example/main.cpp
  )

add_executable ( simple
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
