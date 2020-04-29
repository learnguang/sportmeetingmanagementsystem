package com.handy.annotation;

import java.lang.annotation.*;

/**
 * 以Token注解形式方式重复提交内容
 *
 * @Inherited 表示该注解会被子类继承
 * @Target 说明了Annotation所修饰的对象范围
 * 取值(ElementType)有：
 * 1.CONSTRUCTOR:用于描述构造器
 * 　　2.FIELD:用于描述域
 * 　　3.LOCAL_VARIABLE:用于描述局部变量
 * 　　4.METHOD:用于描述方法
 * 　　5.PACKAGE:用于描述包
 * 　　6.PARAMETER:用于描述参数
 * @Retention 被它所注解的注解保留多久, 定义在RetentionPolicy枚举中.
 * 1.source：注解只保留在源文件，当Java文件编译成class文件的时候，注解被遗弃；被编译器忽略
 * 2.class：注解被保留到class文件，但jvm加载class文件时候被遗弃，这是默认的生命周期
 * 3.runtime：注解不仅被保存到class文件中，jvm加载class文件之后，仍然存在
 * @Documented 表明这个注释是由 javadoc记录的，在默认情况下也有类似的记录工具。 如果一个类型声明被注释了文档化，它的注释成为公共API的一部分。
 */
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface FormToken {
    boolean save() default false;

    boolean remove() default false;
}
