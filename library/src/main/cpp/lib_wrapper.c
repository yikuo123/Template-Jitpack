#include <pjlib.h>
#include "log.h"
#include "lib_wrapper.h"

int lib_pj_init() {
    pj_status_t status = pj_init();
    LOGI("pj_init: status=%d", status);
    return status;
}