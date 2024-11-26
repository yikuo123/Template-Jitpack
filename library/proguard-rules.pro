# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

#-ignorewarnings
#-dontobfuscate

# 保留常见属性
-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod

# 作为lib发布时，不应该混淆和移除公开的方法与属性，参数名也最好不要混淆
# 避免参数名称被混淆
# 该配置暂时没生效，见https://stackoverflow.com/questions/56057586/how-to-keep-class-constructor-argument-parameter-names-with-android-r8
-keepparameternames

# 避免类和接口的方法被混淆和移除,排除BuildConfig
-keep public class !**.BuildConfig, * { public protected *; }
-keep public enum * { public protected *; }
-keep public interface * { *; }

# 避免包含jni方法的类被混淆和移除；避免jni方法的参数与返回值类型被混淆
-keepclasseswithmembers,includedescriptorclasses class * { native <methods>; }

# 保护默认构造方法(android.enableR8.fullMode=true 时需要)
-keepclassmembers class * { public <init>(); }

# 保护异常名称
-keepnames class * extends java.lang.Throwable

# fixed: 默认规则只对 support 库中的 Keep 注解有效
-keep class androidx.annotation.Keep
-keep @androidx.annotation.Keep class * {*;}
-keepclasseswithmembers class * { @androidx.annotation.Keep <methods>; }
-keepclasseswithmembers class * { @androidx.annotation.Keep <fields>; }
-keepclasseswithmembers class * { @androidx.annotation.Keep <init>(...); }

# 第三方库不显示警告
-dontwarn com.android.**
-dontwarn android.**
-dontwarn androidx.**
-dontwarn org.**
-dontwarn com.github.**
-dontwarn java.lang.invoke.**
-dontwarn javax.annotation.**

