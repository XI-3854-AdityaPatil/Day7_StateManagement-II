// Mocks generated by Mockito 5.4.3 from annotations
// in day7_demo/test/presentation/login_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:day7_demo/domain/entities/login_entity.dart' as _i5;
import 'package:day7_demo/domain/entities/request_entity/login_request_entity.dart'
    as _i6;
import 'package:day7_demo/domain/usecase/user_login_usecase.dart' as _i3;
import 'package:day7_demo/util/network/resource.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResult_0<T> extends _i1.SmartFake implements _i2.Result<T> {
  _FakeResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LoginUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginUsecase extends _i1.Mock implements _i3.LoginUsecase {
  MockLoginUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Result<_i5.LoginEntity>> userLogin(
          {required _i6.LoginRequestEntity? requestEntity}) =>
      (super.noSuchMethod(
        Invocation.method(
          #userLogin,
          [],
          {#requestEntity: requestEntity},
        ),
        returnValue: _i4.Future<_i2.Result<_i5.LoginEntity>>.value(
            _FakeResult_0<_i5.LoginEntity>(
          this,
          Invocation.method(
            #userLogin,
            [],
            {#requestEntity: requestEntity},
          ),
        )),
      ) as _i4.Future<_i2.Result<_i5.LoginEntity>>);
}
