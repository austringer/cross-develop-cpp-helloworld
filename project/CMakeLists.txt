cmake_minimum_required(VERSION 3.10)

set(CMAKE_VERBOSE_MAKEFILE ON)

set(sources HelloWorld.cpp)

add_executable(helloworld ${sources})
set_target_properties(helloworld PROPERTIES OUTPUT_NAME "HelloWorld")

target_compile_options(helloworld PUBLIC -std=c++17 -Wall -g)
