/*
 Created by Thanh Son on 24/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart';
import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';

class ColorSerializer extends PrimitiveSerializer<Color> {
  @override
  Iterable<Type> get types => [Color, MaterialColor];

  @override
  String get wireName => 'Color';

  @override
  Color deserialize(Serializers serializers, Object serialized, {FullType specifiedType = FullType.unspecified}) =>
      ColorX.fromHex(serialized.castTo<String>(defaultValue: '#00000000'));

  @override
  Object serialize(Serializers serializers, Color object, {FullType specifiedType = FullType.unspecified}) =>
      object.toHex();
}

class ColorSerializerPlugin extends SerializerPlugin {
  final FullType supportType = const FullType(Color);

  @override
  Object? afterDeserialize(Object? object, FullType specifiedType) => object;

  @override
  Object? afterSerialize(Object? object, FullType specifiedType) => object;

  @override
  Object? beforeDeserialize(Object? object, FullType specifiedType) {
    if (specifiedType == supportType) {
      return ColorX.fromHex(object.castTo<String>(defaultValue: '#00000000'));
    }
    return object;
  }

  @override
  Object? beforeSerialize(Object? object, FullType specifiedType) {
    if (specifiedType == supportType) {
      return object.castTo<Color>(defaultValue: const Color(0x00000000)).toHex();
    }
    return object;
  }
}
