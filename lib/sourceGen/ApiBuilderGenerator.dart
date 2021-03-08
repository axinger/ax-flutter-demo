// import 'dart:convert';
//
// import 'package:analyzer/dart/element/element.dart';
// import 'package:build/build.dart';
// import 'package:source_gen/source_gen.dart';
//
// import 'Request.dart';
//
// class ApiBuilderGenerator extends GeneratorForAnnotation<Request> {
//   @override
//   generateForAnnotatedElement(
//       Element element, ConstantReader annotation, BuildStep buildStep) {
//     print("element is $element");
//     if (element is! ClassElement) {
//       throw InvalidGenerationSourceError(
//           "Request class is not ok for ${element.displayName}");
//     }
//     StringBuffer stringBuffer = StringBuffer("");
//     for (var methodElement in (element as ClassElement).methods) {
//       for (var annometadata in methodElement.metadata) {
//         final metadata = annometadata.computeConstantValue();
//         final metadatatype = annometadata.runtimeType;
//         print("metadatatype is $metadatatype");
//         print("metadata type is ${metadata.type.runtimeType}");
//         if (metadata.type.name == "ApiMethod") {
//           String method = metadata.getField("method").toStringValue();
//           String url = metadata.getField("url").toStringValue();
//           var headerfield = metadata.getField("head");
//           var head = {};
//           if (headerfield != null) {
//             print("headerfield:${headerfield.toMapValue()}");
//             head = headerfield.toMapValue().map((key, value) =>
//                 MapEntry(key.toStringValue(), value.toStringValue()));
//           }
//           if (head == null) {
//             head = {};
//           }
//           head["Content-Type"] = "application/json";
//           print("genertor is ${method}");
//
//           print("bool is ${method == "get"}");
//
//           if ("get" == method) {
//             print("get=================");
//             stringBuffer.write(_genGetAnnotation(url, methodElement, head));
//             stringBuffer.writeln();
//           } else if ("post" == method) {
//             print("post");
//             stringBuffer.write(_genPostAnnotation(url, methodElement, head));
//             stringBuffer.writeln();
//           }
//         }
//       }
//     }
//     return stringBuffer.toString();
//   }
//
//   String _genGetAnnotation(String url, MethodElement element, Map head) {
//     return """
//        Future _\$get_${element.name}() {
//         ${_getHeadMapString(head)}
//         return http.get("$url",headers:header);
//
//        }
//       """;
//   }
//
//   String _genPostAnnotation(String url, MethodElement element, Map head) {
//     return """
//        Future _\$post_${element.name}() {
//         ${_getHeadMapString(head)}
//         return http.post("${url}",headers:header);
//        }
//       """;
//   }
//
//   String _getHeadMapString(Map head) {
//     return """
//         var header =${jsonEncode(head)};
//         """;
//   }
// }
