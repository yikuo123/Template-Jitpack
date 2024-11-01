#include <pjnath.h>
#include "log.h"
#include "com_ikecin_sdk_jni_Demo.h"

JNIEXPORT jstring JNICALL Java_com_ikecin_sdk_jni_Demo_text(JNIEnv *env, jclass class) {
    pj_status_t status = pjnath_init();
    LOGI("jni call ok, result=%d", status);

    const int resultSize = 128;
    char result[resultSize];
    snprintf(result, resultSize, "jni call ok, result=%d", status);

    return (*env)->NewStringUTF(env, result);
}
