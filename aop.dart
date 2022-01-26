@Before([firebaseAspect, tempAspect])
@After([eventCompleteAspect])
@Around(connectivity)
@OnException(exceptionHandler)
Future<void> getData() async {
  ....
}


// ----------------- GENERATED FILE ------------------------

@override
Future<void> getData() {
  try {
    $$FirebaseExceptionAspect().invoke();
    $$TempAspect.invoke();
    $$ConnectivityAspect().invoke(() async {
      await super.getData();
    });
    $$EventCompleteAspect().invoke();
  } catch (e, stackTrace) {
    $$ExceptionHandlerAspect().invoke(e, stackTrace);
  }
}