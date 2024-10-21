abstract class RegistrationUsecase {
  Future<bool> register(
      {required String email, required String password, required String name});
}
