LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := Demo
LOCAL_LDFLAGS := -Wl,--build-id
LOCAL_LDLIBS := \
    -llog \
    -lz \
    -lm \

LOCAL_SRC_FILES := \
    src/main/cpp/com_ikecin_jni_Demo.c \

LOCAL_C_INCLUDES += src/main/cpp

include $(BUILD_SHARED_LIBRARY)
