# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in D:\Android\sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# 作为lib发布时，不应该被混淆和移除公开的方法与属性，参数名也最好不要混淆

-optimizations !code/allocation/variable
-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod
-keepparameternames #不混淆参数名称

-keep public class !**.BuildConfig { public protected *; } #避免类和接口的方法被混淆和移除,BuildConfig类除外
-keep public enum * { public protected *; }
-keepnames class * extends java.lang.Throwable #避免异常名称被混淆
-keep class * implements android.os.Parcelable { public static final android.os.Parcelable$Creator *; } #序列化相关
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keepclasseswithmembernames,includedescriptorclasses class * { native <methods>; } #避免包含jni方法的类被混淆和移除

-dontwarn org.apache.**
-dontwarn android.**
-dontwarn java.lang.invoke.**
