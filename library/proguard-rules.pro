#-ignorewarnings
#-dontobfuscate

# 保留常见属性
-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod

# 作为lib发布时，避免常规方法参数名称被混淆
-keepparameternames
# 作为lib发布时，避免抽象方法参数名称被混淆（还需指定编译参数 -parameters）
-keepattributes MethodParameters

# 作为lib发布时，避免不同 lib 间包名冲突
-keeppackagenames

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

