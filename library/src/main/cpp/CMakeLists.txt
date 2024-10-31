# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html
# CMake documentation: https://cmake.org/cmake/help/v3.6/manual/cmake-commands.7.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.6.0)

project(Library)

message("PROJECT_NAME=${PROJECT_NAME}")
message("ANDROID_ABI=${ANDROID_ABI}")
message("ANDROID_PLATFORM=${ANDROID_PLATFORM}")
message("PROJECT_SOURCE_DIR=${PROJECT_SOURCE_DIR}")

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

add_library(
        # Sets the name of the library.
        Demo

        # Sets the library as a shared library.
        SHARED

        # Provides a relative path to your source file(s).
        com_ikecin_sdk_jni_Demo.c
)

# Searches for a specified prebuilt library and stores the path as a
# variable. Because CMake includes system libraries in the search path by
# default, you only need to specify the name of the public NDK library
# you want to add. CMake verifies that the library exists before
# completing its build.

find_library(
        # Sets the name of the path variable.
        log-lib

        # Specifies the name of the NDK library that
        # you want CMake to locate.
        log
)


# Specifies libraries CMake should link to your target library. You
# can link multiple libraries, such as libraries you define in this
# build script, prebuilt third-party libraries, or system libraries.

target_link_libraries(
        # Specifies the target library.
        Demo

        # Links the target library to the log library
        # included in the NDK.
        ${log-lib}
)

# 定义宏
add_definitions(
        -DPJ_IS_BIG_ENDIAN=1
        -DPJ_IS_LITTLE_ENDIAN=01
)

# 添加头文件搜索路径
target_include_directories(
        # Specifies the target library.
        Demo PRIVATE

        # Include header directories
        ${PROJECT_SOURCE_DIR}/thirdParty/include/pjlib/
        ${PROJECT_SOURCE_DIR}/thirdParty/include/pjlib-util/
        ${PROJECT_SOURCE_DIR}/thirdParty/include/pjnath/
)

# 添加链接的库
target_link_libraries(
        # Specifies the target library.
        Demo

        # Links the target library to libraries
        ${PROJECT_SOURCE_DIR}/thirdParty/libs/${ANDROID_ABI}/libpj.a
        ${PROJECT_SOURCE_DIR}/thirdParty/libs/${ANDROID_ABI}/libpjlib-util.a
        ${PROJECT_SOURCE_DIR}/thirdParty/libs/${ANDROID_ABI}/libpjnath.a
)