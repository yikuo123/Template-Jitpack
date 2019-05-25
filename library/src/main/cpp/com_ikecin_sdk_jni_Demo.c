#include "log.h"
#include "com_ikecin_sdk_jni_Demo.h"

JNIEXPORT jstring JNICALL Java_com_ikecin_sdk_jni_Demo_text (JNIEnv *env, jclass class) {
    LOGI("jni call ok");
    return (*env)->NewStringUTF(env, "jni call ok");
}
