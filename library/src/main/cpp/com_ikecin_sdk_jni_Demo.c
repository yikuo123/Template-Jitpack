#include "stdio.h"
#include "log.h"
#include "lib_wrapper.h"

/*
JNIEXPORT jint JNI_OnLoad(JavaVM *vm, void *reserved) {
    LOGI("JNI_OnLoad");
    return JNI_VERSION_1_4;
}

JNIEXPORT void JNI_OnUnload(JavaVM *vm, void *reserved) {
    LOGI("JNI_OnUnload");
}
*/

JNIEXPORT jstring JNICALL Java_com_ikecin_sdk_jni_Demo_text(JNIEnv *env, jclass class) {
    int status = lib_pj_init();
    LOGI("lib_pj_init: status=%d", status);

    char message[128];
    snprintf(message, sizeof(message), "lib_pj_init: status=%d", status);

    return (*env)->NewStringUTF(env, message);
}
