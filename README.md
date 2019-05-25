# JitPack Demo

[![](https://jitpack.io/v/yikuo123/Template-Jitpack.svg)](https://jitpack.io/#yikuo123/Template-Jitpack)

## Description

This is description.

## Usage

### Gradle Dependency 

- Project level `build.gradle`

```gradle
allprojects {
    repositories {
        maven { url 'https://jitpack.io' }
    }
}
```

- App level `build.gradle`

```gradle
dependencies {
    implementation 'com.github.yikuo123:Template-Jitpack:4d16276647'
}
```

# JNI 使用说明

## 在 `library` 的 `build.gradle` 中添加 `ndk` 配置

```gradle
android {
    defaultConfig {
        ndk {
            moduleName "Demo"
        }
        externalNativeBuild {
            cmake {
                cppFlags ""
            }
        }
    }
    externalNativeBuild {
        cmake {
            path "src/main/cpp/CMakeLists.txt"
        }
    }
}
```

## 添加 `jni` 接口

```java
package com.ikecin.sdk.jni;
public class Demo {
    static {
        System.loadLibrary("Demo");
    }

    public static native String text();
}
```

## 进入 `library` 目录

以下的命令都是在 `library` 目录执行


## 使用 `javac` 编译成 `class` 文件

```bash
javac src/main/java/com/ikecin/sdk/jni/Demo.java -d ./build 
```

## 使用 javah 生成c头文件

```bash
javah -d src/main/cpp -classpath ./build com.ikecin.sdk.jni.Demo
```

`library/main/cpp` 下会自动生成头文件

## 编写C文件

创建同名c文件,实现头文件中的方法

# 构建

在`library`中创建文件 `src/main/cpp/CMakeLists.txt`

配置cmake，内容如下(详见Demo)

```cmake
cmake_minimum_required(VERSION 3.4.1)

add_library( # Sets the name of the library.
        Demo

        # Sets the library as a shared library.
        SHARED

        # Provides a relative path to your source file(s).
        com_ikecin_sdk_jni_Demo.c)

find_library( # Sets the name of the path variable.
        log-lib

        # Specifies the name of the NDK library that
        # you want CMake to locate.
        log)

target_link_libraries( # Specifies the target library.
        Demo

        # Links the target library to the log library
        # included in the NDK.
        ${log-lib})
```

> 注意，要使用Linux的分割符，否则在JitPack构建会出错（Windows上使用Linux分隔符仍能正常编译）

# 配置混淆文件，排除jni方法

`-keepclasseswithmembernames,includedescriptorclasses class * { native <methods>; }`

# 其它参考

http://wiki.jikexueyuan.com/project/jni-ndk-developer-guide/
