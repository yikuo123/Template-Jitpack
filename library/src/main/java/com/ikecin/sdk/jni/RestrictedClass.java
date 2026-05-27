package com.ikecin.sdk.jni;

import androidx.annotation.RestrictTo;

@RestrictTo(RestrictTo.Scope.LIBRARY)
public class RestrictedClass {
    public void test1(int test1) {
        System.out.println("这个类方法不允许外部调用");
    }

    public void test2(String test2) {
    }
}
