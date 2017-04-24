import 'dart:collection';

// DO use adjacent strings to concatenate string literals.
// https://www.dartlang.org/guides/language/effective-dart/usage#do-use-adjacent-strings-to-concatenate-string-literals
class PreferAdjacentStringConcatenation {
  final myString = 'this is a literal that is really long' +
      ' and this is another one and it is also so long.';
}

// DO use collection literals when possible.
// https://www.dartlang.org/guides/language/effective-dart/usage#do-use-collection-literals-when-possible
class PreferCollectionLiterals {
  final list = new List<int>();
  final map = new Map<String, int>();
  final linkedHashMap = new LinkedHashMap<String, int>();
}

// AVOID using Iterable.forEach() with a function literal.
// https://www.dartlang.org/guides/language/effective-dart/usage#avoid-using-iterableforeach-with-a-function-literal
class AvoidFunctionLiteralsInForEachCalls {
  List<int> numbers;
  void foo() {
    numbers.forEach((i) => print(i + 1));
  }
}

// DO use a function declaration to bind a function to a name.
// https://www.dartlang.org/guides/language/effective-dart/usage#do-use-a-function-declaration-to-bind-a-function-to-a-name
class PreferFunctionDeclarationsOverVariables {
  void foo() {
    var localFunction = (int a) {
      print(a + 1);
    };
    [].forEach(localFunction);
  }
}

// DON’T create a lambda when a tear-off will do.
// https://www.dartlang.org/guides/language/effective-dart/usage#dont-create-a-lambda-when-a-tear-off-will-do
class UnnecessaryLambdas {
  bool isPair(int a) => a % 2 == 0;
  void foo() {
    [].where((e) => isPair(e));
  }
}

// DON’T explicitly initialize variables to null.
// https://www.dartlang.org/guides/language/effective-dart/usage#dont-explicitly-initialize-variables-to-null
class AvoidInitToNull {
  String whyNull = null;
}

// CONSIDER omitting the types for local variables.
// https://www.dartlang.org/guides/language/effective-darhttps://www.dartlang.org/guides/language/effective-dart/usage#dont-explicitly-initialize-variables-to-nullt/usage#consider-omitting-the-types-for-local-variables
class OmitLocalVariableTypes {
  void foo() {
    final StringBuffer buffer = new StringBuffer();
    buffer.write('foo');
  }
}

// CONSIDER using => for short members whose body is a single return statement.
// https://www.dartlang.org/guides/language/effective-dart/usage#consider-using--for-short-members-whose-body-is-a-single-return-statement
class PreferExpressionFunctionBody {
  bool isPair(int a) {
    return a % 2 == 0;
  }
}

// DON’T use this. when not needed to avoid shadowing.
// https://www.dartlang.org/guides/language/effective-dart/usage#dont-use-this-when-not-needed-to-avoid-shadowing
class UnnecessaryThis {
  int x, y;

  bool equalTo(UnnecessaryThis o) => this.x == o.x && this.y == o.y;

  void foo() {
    this.equalTo(null);
  }
}

// DO use initializing formals when possible.
// https://www.dartlang.org/guides/language/effective-dart/usage#do-use-initializing-formals-when-possible
class PreferInitializingFormals {
  num x, y;
  PreferInitializingFormals(num x, num y) {
    this.x = x;
    this.y = y;
  }
}

// AVOID catches without on clauses.
// https://www.dartlang.org/guides/language/effective-dart/usage#avoid-catches-without-on-clauses
class AvoidCatchesWithoutOnClauses {
  void foo() {
    try {} catch (e) {
      print('Hi');
    }
  }
}

// DON’T explicitly catch Error or types that implement it.
// https://www.dartlang.org/guides/language/effective-dart/usage#dont-explicitly-catch-error-or-types-that-implement-it
class DoNotCatchErrors {
  void foo() {
    try {} on Error {
      print('Hi');
    }
  }
}

// DO use rethrow to rethrow a caught exception.
// https://www.dartlang.org/guides/language/effective-dart/usage#do-use-rethrow-to-rethrow-a-caught-exception
class UseRethrowWhenPossible {
  void foo() {
    try {} on Exception catch (e) {
      print('Hi');
      throw e;
    }
  }
}

// PREFER naming a method to___() if it copies the object’s state to a new object.
// https://www.dartlang.org/guides/language/effective-dart/design#prefer-naming-a-method-to-if-it-copies-the-objects-state-to-a-new-object
// PREFER naming a method as___() if it returns a different representation backed by the original object.
// https://www.dartlang.org/guides/language/effective-dart/design#prefer-naming-a-method-as___-if-it-returns-a-different-representation-backed-by-the-original-object
abstract class UseToAndAsIfApplicable extends Iterable<dynamic> {
  List foo() => new List.from(this);
}

// PREFER defining constructors instead of static methods to create instances.
// https://www.dartlang.org/guides/language/effective-dart/design#prefer-defining-constructors-instead-of-static-methods-to-create-instances
class PreferConstructorsInsteadOfStaticMethods {
  int x;

  PreferConstructorsInsteadOfStaticMethods(this.x);

  static PreferConstructorsInsteadOfStaticMethods foo() =>
      new PreferConstructorsInsteadOfStaticMethods(0);
}

// DO use a setter for operations that conceptually change a property.
// https://www.dartlang.org/guides/language/effective-dart/design#do-use-a-setter-for-operations-that-conceptually-change-a-property
class UseSettersToChangeAProperty {
  // ignore: unused_field
  int _x;
  void setX(int x) {
    _x = x;
  }
}

// AVOID returning null from members whose return type is bool, double, int, or num.
// https://www.dartlang.org/guides/language/effective-dart/design#avoid-returning-null-from-members-whose-return-type-is-bool-double-int-or-num
class AvoidReturningNull {
  bool aBool() => null;
  num aNum() => null;
  int aInt() => null;
  double aDouble() => null;
}

// AVOID returning this from methods just to enable a fluent interface.
// https://www.dartlang.org/guides/language/effective-dart/design#avoid-returning-this-from-methods-just-to-enable-a-fluent-interface
class AvoidReturningThis {
  int x;

  AvoidReturningThis addOne() {
    x++;
    return this;
  }
}

// AVOID annotating types on function expressions.
// https://www.dartlang.org/guides/language/effective-dart/design#avoid-annotating-types-on-function-expressions
class AvoidTypesOnClosureParameters {
  List<int> list;

  List<int> foo() => list.where((int a) => a % 2 == 0);
}

// AVOID annotating with dynamic when not required.
// https://www.dartlang.org/guides/language/effective-dart/design#avoid-annotating-with-dynamic-when-not-required
class AvoidAnnotatingWithDynamic {
  void foo(dynamic a) {
    print(a);
  }
}

// AVOID positional boolean parameters.
// https://www.dartlang.org/guides/language/effective-dart/design#avoid-positional-boolean-parameters
class AvoidPositionalBooleanParameters {
  bool value;

  void bad(bool value) {}
  void good({bool value}) {}
}

// DON’T check for null in custom == operators.
// https://www.dartlang.org/guides/language/effective-dart/design#dont-check-for-null-in-custom--operators
class DoNotCheckForNullInEqualityOperators {
  final name = 'myName';

  @override
  operator ==(other) =>
      other != null &&
      other is DoNotCheckForNullInEqualityOperators &&
      name == other.name;
}

class PreferConditionalAssignments {
  String lazyName;

  void foo() {
    if (lazyName == null) {
      lazyName = 'myName';
    }
    print(lazyName);
  }
}

class JoinReturnWithAssignmentWhenPossible {
  String _lazyName;

  String get name {
    _lazyName ??= 'myName';
    return _lazyName;
  }
}

class UnnecessaryOverride extends PreferConditionalAssignments {
  @override
  void foo() {
    super.foo();
  }

  @override
  String toString() => super.toString();

  @override
  String get lazyName => super.lazyName;

  @override
  set lazyName(String other) => super.lazyName = other;
}
