package com.ikecin.sdk.demo;

import com.ikecin.sdk.jni.BuildConfig;

public class PublicClass {
    public void test1(int test1) {
        System.out.println(BuildConfig.LIBRARY_PACKAGE_NAME);
    }

    public void test2(String test2) {
    }
}
