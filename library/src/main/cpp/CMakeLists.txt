# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html
# CMake documentation: https://cmake.org/cmake/help/v3.22/manual/cmake-commands.7.html
# https://developer.android.google.cn/ndk/guides/cmake?hl=zh-cn
# https://developer.android.google.cn/studio/projects/configure-cmake?hl=zh-cn

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.22.0)

project(Demo)

set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -DDEBUG=1")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG=1")

message("PROJECT_NAME=${PROJECT_NAME}")
message("ANDROID_ABI=${ANDROID_ABI}")
message("ANDROID_PLATFORM=${ANDROID_PLATFORM}")
message("CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}")
message("ARTIFACT_ID=${ARTIFACT_ID}")
message("PROJECT_SOURCE_DIR=${PROJECT_SOURCE_DIR}")

# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

add_library(
        # Sets the name of the library.
        ${PROJECT_NAME}

        # Sets the library as a shared library.
        SHARED

        # Provides a relative path to your source file(s).
        com_ikecin_sdk_jni_Demo.c
        lib_wrapper.c
)

# 16KB page size support (Android 15+)
if(ANDROID_NATIVE_API_LEVEL GREATER_EQUAL 35)
    target_link_options(
            ${PROJECT_NAME}
            PRIVATE
            "-Wl,-z,max-page-size=16384"
    )
endif()

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
        ${PROJECT_NAME}

        # Links the target library to the log library
        # included in the NDK.
        ${log-lib}
)

# 添加自定义宏
target_compile_definitions(
        # Specifies the target library.
        ${PROJECT_NAME}

        # definitions
        PRIVATE LOG_TAG="lib${PROJECT_NAME}"
        PRIVATE PJ_AUTOCONF=1
)

# 添加头文件搜索路径
target_include_directories(
        # Specifies the target library.
        ${PROJECT_NAME} PRIVATE

        # Header directories
        thirdParty/include/${ANDROID_ABI}/pjlib
        thirdParty/include/common/pjlib
)

# 添加库搜索路径
target_link_directories(
        # Specifies the target library.
        ${PROJECT_NAME} PRIVATE

        # library directories
        thirdParty/libs/${ANDROID_ABI}
)

# 添加链接的库
target_link_libraries(
        # Specifies the target library.
        ${PROJECT_NAME}

        # Links the target library to libraries
        libpj.a
)