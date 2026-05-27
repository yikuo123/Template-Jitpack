# Add project specific ProGuard rules here.
# For more details, see
# http://developer.android.com/guide/developing/tools/proguard.html

-ignorewarnings
-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod

-keepnames class * extends java.lang.Throwable
-dontwarn com.android.**
-dontwarn android.**
-dontwarn androidx.**
-dontwarn org.**
-dontwarn com.github.**
