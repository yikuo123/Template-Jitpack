package com.ikecin.sdk.jni.internal;

import androidx.annotation.Keep;

@Keep
public class KeptInternalClass {
    private int a = 0;

    public void test1(long test1) {
        System.out.println(test1);
    }

    public void test2(String test2) {
        System.out.println(test2);
    }
}
