cmake_minimum_required(VERSION 2.8)
project(tinyscheme)

find_package(Threads)

add_definitions(-Wno-pointer-to-int-cast -Wno-int-to-pointer-cast)

add_executable(tinyscheme.repl repl.c)
add_executable(tinyscheme.test test.c)

add_library(tinyscheme.static STATIC scheme.c)
add_library(tinyscheme SHARED scheme.c)

target_link_libraries(tinyscheme                        ${CMAKE_DL_LIBS} ${CMAKE_THREAD_LIBS_INIT} m)
target_link_libraries(tinyscheme.repl                   ${CMAKE_DL_LIBS} ${CMAKE_THREAD_LIBS_INIT} m)
target_link_libraries(tinyscheme.test tinyscheme.static ${CMAKE_DL_LIBS} ${CMAKE_THREAD_LIBS_INIT} m)

target_compile_definitions(tinyscheme.static PRIVATE USE_INTERFACE=1 STANDALONE=0)
target_compile_definitions(tinyscheme        PRIVATE USE_INTERFACE=1 STANDALONE=0)