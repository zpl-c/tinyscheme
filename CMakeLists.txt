cmake_minimum_required(VERSION 2.8)
project(tinyscheme)

find_package(Threads)

if (STANDALONE)
add_executable(tinyscheme scheme.c)
else ()
add_library(tinyscheme STATIC scheme.c)
add_library(tinyscheme_dynamic SHARED scheme.c)
endif ()

target_link_libraries(tinyscheme ${CMAKE_DL_LIBS} ${CMAKE_THREAD_LIBS_INIT} m)
