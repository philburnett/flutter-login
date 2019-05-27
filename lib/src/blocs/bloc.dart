import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {

  final _emailCont = BehaviorSubject<String>();
  final _passwordCont = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailCont.sink.add;
  Function(String) get changePassword => _passwordCont.sink.add;

  Stream<String> get email => _emailCont.stream.transform(validateEmail);
  Stream<String> get password => _passwordCont.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  submit() {
    final validEmail =_emailCont.value;
    final validPassword =_passwordCont.value;

    print('$validEmail : $validPassword');
  }

  dispose() {
    _emailCont.sink.close();
    _passwordCont.sink.close();
  }
}
