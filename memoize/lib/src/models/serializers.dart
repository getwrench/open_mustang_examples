// GENERATED CODE - DO NOT MODIFY BY HAND 

// **************************************************************************
// AppSerializerBuilder
// **************************************************************************
   
import 'dart:convert';    
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:memoize/src/models/counter.model.dart';

part 'serializers.g.dart';

@SerializersFor([
  Counter
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(
        StandardJsonPlugin(),
      ))
    .build();

final List<String> serializerNames = [
  '$Counter'
];
    
void json2Type(void Function<T>(T t) update, String modelName, String jsonStr) {
      if(modelName == '$Counter') {
      var model = serializers.deserializeWith(
        Counter.serializer,
        json.decode(jsonStr),
      );
      if (model != null) {
        update(model);
      }
      return;
    }

}