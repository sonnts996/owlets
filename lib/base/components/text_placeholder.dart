/*
 Created by Thanh Son on 23/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

import '../../gen/assets.gen.dart';

String labelPHolder([int words = 20, String? description]) => loremIpsum(words: words);

String paragraphContentPHolder([int paragraphs = 1, String? description]) => loremIpsum(paragraphs: paragraphs);

Widget walletIconPHolder({double size = 24}) => Assets.image.logoOwlet.svg(height: size, width: size);
