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

# 作为lib发布时，避免参数名称被混淆
-keepparameternames

# 作为lib发布时，避免不同 lib 间包名冲突
#-keeppackagenames
-flattenpackagehierarchy 'com.ikecin.sdk.jni'

# 作为lib发布时，保护 public 类（不包括 BuildConfig、internal 包及其子包下的类）的 public/protected 成员不被移除和混淆
-keep,allowoptimization public class !**.BuildConfig, !**.internal.**, !**.internal$** { public protected *;}
-keep,allowoptimization public enum !**.internal.**, !**.internal$** { public protected *; }
-keep,allowoptimization public interface !**.internal.**, !**.internal$** { *; }

# 避免包含jni方法的类被混淆和移除；避免jni方法的参数与返回值类型被混淆
-keepclasseswithmembers,includedescriptorclasses class * { native <methods>; }

# 保护默认构造方法(android.enableR8.fullMode=true 时需要)
-keepclassmembers class * { public <init>(); }

# 保护异常名称
-keepnames class * extends java.lang.Throwable

# 第三方库不显示警告
-dontwarn com.android.**
-dontwarn android.**
-dontwarn androidx.**
-dontwarn org.**
-dontwarn com.github.**
-dontwarn java.lang.invoke.**
-dontwarn javax.annotation.**

