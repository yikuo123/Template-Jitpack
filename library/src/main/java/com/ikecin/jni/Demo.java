package com.ikecin.jni;

public class Demo {
    static {
        System.loadLibrary("Demo");
    }

    public static native String text();
}
