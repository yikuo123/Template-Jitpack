package com.ikecin.sdk.jni;

import com.ikecin.sdk.jni.internal.ReferencedInternalClass;

public class Demo {
    static {
        System.loadLibrary("Demo");
    }

    /**
     * 这是一个 demo
     *
     * @return 字符串
     */
    public static native String text();

    public void test1() {
        var test = new ReferencedInternalClass();
        test.test1(System.currentTimeMillis());
    }
}
