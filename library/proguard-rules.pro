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

# 作为lib发布时，不应该混淆和移除公开的方法与属性，参数名也最好不要混淆

# 保留常见属性
-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod

# 避免类和接口的方法被混淆和移除,排除BuildConfig
-keep public class !**.BuildConfig, * { public protected *; }
-keep public enum * { public protected *; }
-keep public interface * { *; }

# 避免包含jni方法的类被混淆和移除；避免jni方法的参数与返回值类型被混淆
-keepclasseswithmembers,includedescriptorclasses class * { native <methods>; }

# 避免异常名称被混淆
-keepnames class * extends java.lang.Throwable

# 避免参数名称被混淆,该配置暂时没生效，见https://stackoverflow.com/questions/56057586/how-to-keep-class-constructor-argument-parameter-names-with-android-r8
-keepparameternames

-dontwarn org.apache.**
-dontwarn android.**
-dontwarn androidx.**
-dontwarn java.lang.invoke.**
-dontwarn javax.annotation.**
