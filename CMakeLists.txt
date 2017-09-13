cmake_minimum_required(VERSION 2.8)
project(tinyscheme)

find_package(Threads)

add_definitions(-Wno-pointer-to-int-cast -Wno-int-to-pointer-cast)

add_executable(tinyscheme.repl test/repl.c source/dynload.c)
add_executable(tinyscheme.test test/test.c)

include_directories(include
	node_modules/zpl.c/include
	node_modules/zpl_json.c/include)

add_library(tinyscheme.static STATIC source/scheme.c source/dynload.c)
add_library(tinyscheme SHARED source/scheme.c source/dynload.c)

target_link_libraries(tinyscheme                        ${CMAKE_DL_LIBS} ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries(tinyscheme.repl                   ${CMAKE_DL_LIBS} ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries(tinyscheme.test tinyscheme.static ${CMAKE_DL_LIBS} ${CMAKE_THREAD_LIBS_INIT})

if (UNIX) 
	target_link_libraries(tinyscheme                        m)
	target_link_libraries(tinyscheme.repl                   m)
	target_link_libraries(tinyscheme.test tinyscheme.static m)
endif()

target_compile_definitions(tinyscheme.static PRIVATE USE_INTERFACE=1 STANDALONE=0)
target_compile_definitions(tinyscheme        PRIVATE USE_INTERFACE=1 STANDALONE=0)