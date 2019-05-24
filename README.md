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

## 在module的build.gradle中添加

```gradle
defaultConfig {
    ndk {
        moduleName "demo"
    }
}
```

## 添加native接口

```java
public class Demo {
    static {
        System.loadLibrary("demo");
    }
    
    public native String methodA();
}
```

## 选中library的Project，执行Build->Make Module


## 使用 javah 生成c头文件

进入library module目录


```bash
javah -d src\main\library -classpath build\intermediates\javac\debug\compileDebugJavaWithJavac\classes\ com.ikecin.jni.Demo
```

`library\main\jni` 下会自动生成头文件

# 编写C文件

创建同名c文件,实现头文件中的方法


# 添加编译脚本

模块的build.gradle添加

```gradle
android {
    externalNativeBuild {
        ndkBuild {
            path 'Android.mk'
        }
    }
}
```

内容如下

```makefile
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := demo
LOCAL_LDFLAGS := -Wl,--build-id
LOCAL_LDLIBS := \
    -llog \
    -lz \
    -lm \

LOCAL_SRC_FILES := \
    src/main/jni/com_ikecin_jni_Demo.c \

LOCAL_C_INCLUDES += src/main/jni

include $(BUILD_SHARED_LIBRARY)
```

> 注意，要使用Linux的分割符，否则在JitPack构建会出错（Windows上使用Linux分隔符仍能正常编译）


# 执行构建操作


# 配置混淆文件，排除jni方法

`-keepclasseswithmembernames,includedescriptorclasses class * { native <methods>; }`


# 其它参考

http://wiki.jikexueyuan.com/project/jni-ndk-developer-guide/

https://blog.piasy.com/2017/08/26/NDK-Start-Guide/#jclass-jmethodid-and-jfieldid
