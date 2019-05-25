package com.ikecin.sdk.jni;

public class Demo {
    static {
        System.loadLibrary("Demo");
    }

    public static native String text();
}
