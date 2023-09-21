cmake_minimum_required(VERSION 3.22 FATAL_ERROR)

project(FizzBuzz VERSION 1.0.0 LANGUAGES C)

# Настройка компиляции с использованием c17
set(CC clang)
set(CXX clang++)
set(CMAKE_C_COMPILER clang)
set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON) # -fPIC
#set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_C_FLAGS_DEBUG "-g")
set(CMAKE_C_FLAGS_RELEASE "-O3")

# Находим необходимые библиотеки
#find_package(PkgConfig REQUIRED)
#pkg_check_modules(LIBUV REQUIRED IMPORTED_TARGET libuv)
#find_package(Threads REQUIRED)

#include(FetchContent)
# Set source files
set(LIBFIZZBUZZ_SOURCES
    library/libfizzbuzz.c
    library/libfizzbuzz.def
)

# Set include directories
set(LIBFIZZBUZZ_INCLUDE_DIRS
    ${CMAKE_CURRENT_SOURCE_DIR}/library
)

# Add the shared library
add_library(libfizzbuzz SHARED ${LIBFIZZBUZZ_SOURCES})

# Add include directories
target_include_directories(libfizzbuzz PUBLIC ${LIBFIZZBUZZ_INCLUDE_DIRS})

# Link necessary libraries
#target_link_libraries(libfizzbuzz PRIVATE PkgConfig::LIBUV ${CMAKE_THREAD_LIBS_INIT})

# https://llhttp.org/
# https://github.com/nodejs/llhttp/tree/main
#FetchContent_Declare(llhttp URL "https://github.com/nodejs/llhttp/archive/refs/tags/release/v9.1.2.tar.gz")
#
#set(BUILD_SHARED_LIBS OFF CACHE INTERNAL "")
#set(BUILD_STATIC_LIBS ON CACHE INTERNAL "")
#FetchContent_MakeAvailable(llhttp)
#
## Link with the libuv, llhttp_static and pthread targets
#target_link_libraries(libfizzbuzz PRIVATE PkgConfig::LIBUV llhttp_static ${CMAKE_THREAD_LIBS_INIT})

#find_package(OpenMP)
#if(OpenMP_C_FOUND)
#    target_link_libraries(libfizzbuzz PRIVATE OpenMP::OpenMP_C)
#endif()

target_compile_options(libfizzbuzz PRIVATE
  -std=c17
)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  target_compile_options(libfizzbuzz PRIVATE
    -fcolor-diagnostics
    -fansi-escape-codes
    -O0
    -g
    -fopenmp
  )
else()
  target_compile_options(libfizzbuzz PRIVATE
    -O3
    -march=native
    -funroll-loops
    -fopenmp
    -Wall
    -Wextra
    -pedantic
    -Werror
  )
endif()

# Добавляем исполняемый файл
#add_executable(fizzbuzz library/main.c)
#target_link_libraries(fizzbuzz libfizzbuzz)

# Устанавливаем целевую директорию для компиляции в build/
set_target_properties(libfizzbuzz PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build"
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build"
)

# Настройка имени библиотеки в зависимости от платформы
if(WIN32)
    set_target_properties(libfizzbuzz PROPERTIES OUTPUT_NAME "fizzbuzz")
elseif(APPLE)
    set_target_properties(libfizzbuzz PROPERTIES OUTPUT_NAME "fizzbuzz")
else()
    set_target_properties(libfizzbuzz PROPERTIES OUTPUT_NAME "fizzbuzz")
endif()

# Testing:
#add_executable(test_runner test/test_runner.c test/unity/unity.c)
#target_link_libraries(test_runner libfizzbuzz ${CMAKE_THREAD_LIBS_INIT})
#enable_testing()
#add_test(NAME test_runner COMMAND test_runner)
