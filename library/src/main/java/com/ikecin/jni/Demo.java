package com.ikecin.jni;

public class Demo {
    static {
        System.loadLibrary("demo");
    }

    public static native String methodA();
}
