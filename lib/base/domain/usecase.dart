/*
 Created by Thanh Son on 21/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'dart:async';

mixin UseCaseWithoutParams<R extends Object> {
  Future<R> execute();

  Future<R> call() => execute();
}

mixin UseCase<P extends Object, R extends Object> {
  Future<R> execute(P params);

  Future<R> call(P params) => execute(params);
}
