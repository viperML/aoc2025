cmake_minimum_required(VERSION 4.1)

project(aoc20205 LANGUAGES CXX)

include(GNUInstallDirs)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

function(DAY name)
    add_executable(${name})
    target_sources(
        ${name}
        PUBLIC
        "./${name}/main.cpp"
        "./common/aoc-common.cpp"
    )
    target_include_directories(
        ${name}
        PRIVATE
        ./common
    )
    target_compile_options(${name} PRIVATE -Werror -Wpedantic)

    if(CMAKE_BUILD_TYPE MATCHES "Debug")
          target_compile_options(
            ${name}
            PRIVATE -O0 -fsanitize=undefined -fsanitize=address -fno-omit-frame-pointer
          )
          target_link_options(${name}
            PRIVATE -fsanitize=undefined -fsanitize=address
          )
    endif()
endfunction()


day(day1)
