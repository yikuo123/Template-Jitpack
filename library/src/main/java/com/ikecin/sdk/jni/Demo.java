package com.ikecin.sdk.jni;

public class Demo {
    static {
        System.loadLibrary("Demo");
    }

    /**
     * 这是一个 demo
     * @return 字符串
     */
    public static native String text();
}
