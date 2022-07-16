abstract class UsersRepository {
  Future<void> loadUsers();
}

class UsersRepositoryImpl extends UsersRepository {
  UsersRepositoryImpl();

  @override
  Future<void> loadUsers() async {
    //return User.fromJSON(reader.asMap());
  }
}
