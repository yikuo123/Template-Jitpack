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
