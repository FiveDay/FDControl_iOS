# FDControl_iOS
[![LICENSE](https://img.shields.io/badge/license-Anti%20996-blue.svg)](https://github.com/996icu/996.ICU/blob/master/LICENSE)

JSONDecoder
==============
特性
==============
- **高性能**: 模型转换性能接近手写解析代码。
- **自动类型转换**: 对象类型可以自动转换，详情见下方表格。
- **类型安全**: 转换过程中，所有的数据类型都会被检测一遍，以保证类型安全，避免崩溃问题。
- **无侵入性**: 模型无需继承自其他基类。
- **轻量**: 该框架只有 5 个文件 (包括.h文件)。
- **文档和单元测试**: 文档覆盖率100%, 代码覆盖率99.6%。

Features
==============
- **High performance**: The conversion performance is close to handwriting code.
- **Automatic type conversion**: The object types can be automatically converted.
- **Type Safe**: All data types will be verified to ensure type-safe during the conversion process.
- **Non-intrusive**: There is no need to make the model class inherit from other base class.
- **Lightwight**: This library contains only 5 files.
- **Docs and unit testing**: 100% docs coverage, 99.6% code coverage.

当 JSON/Dictionary 中的对象类型与 Model 属性不一致时，YYModel 将会进行如下自动转换。自动转换不支持的值将会被忽略，以避免各种潜在的崩溃问题。

<table>
  <thead>
    <tr>
      <th>Model</th>
      <th>JSON/Dictionary</th>
    </tr>
  </thead>
  <tbody>
      <tr>
      	<td>NSNumber</td>
      	<td>"123", "234.2", "no", "false", "yes", "true", "null"</td>
      </tr>
      
       <tr>
      	<td>NSString("YYYY-MM-dd'T'HH:mm:ssZ")</td>
      	<td>527, 344.2, "nil", "null", NSDate</td>
      </tr>
      
       <tr>
      	<td>NSDate</td>
      	<td>"yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd'T'HH:mm:ss", "yyyy-MM-dd'T'HH:mm:ssZ", "EEE MMM dd HH:mm:ss Z yyyy"</td>
  </tbody>
</table>

<table>
  <thead>
    <tr>
      <th>JSON/Dictionary</th>
      <th>Model</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>NSString</td>
      <td>NSNumber,NSURL,SEL,Class</td>
    </tr>
    <tr>
      <td>NSNumber</td>
      <td>NSString</td>
    </tr>
    <tr>
      <td>NSString/NSNumber</td>
      <td>基础类型 (BOOL,int,float,NSUInteger,UInt64,...)<br/>
      NaN 和 Inf 会被忽略</td>
    </tr>
    <tr>
      <td>NSString</td>
      <td>NSDate 以下列格式解析:<br/>
      yyyy-MM-dd<br/>
yyyy-MM-dd HH:mm:ss<br/>
yyyy-MM-dd'T'HH:mm:ss<br/>
yyyy-MM-dd'T'HH:mm:ssZ<br/>
EEE MMM dd HH:mm:ss Z yyyy
      </td>
    </tr>
    <tr>
      <td>NSDate</td>
      <td>NSString 格式化为 ISO8601:<br/>
      "YYYY-MM-dd'T'HH:mm:ssZ"</td>
    </tr>
    <tr>
      <td>NSValue</td>
      <td>struct (CGRect,CGSize,...)</td>
    </tr>
    <tr>
      <td>NSNull</td>
      <td>nil,0</td>
    </tr>
    <tr>
      <td>"no","false",...</td>
      <td>@(NO),0</td>
    </tr>
    <tr>
      <td>"yes","true",...</td>
      <td>@(YES),1</td>
    </tr>
  </tbody>
</table>