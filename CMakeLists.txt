cmake_minimum_required(VERSION 2.8)
project(tinyscheme)

find_package(Threads)

add_executable(tinyscheme repl.c)
add_executable(tinyscheme.test test.c)

target_link_libraries(tinyscheme ${CMAKE_DL_LIBS} ${CMAKE_THREAD_LIBS_INIT} m)
target_link_libraries(tinyscheme.test ${CMAKE_DL_LIBS} ${CMAKE_THREAD_LIBS_INIT} m)