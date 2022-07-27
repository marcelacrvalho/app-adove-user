import 'package:adove/app/data/graphql/mutations.dart';
import 'package:adove/app/data/graphql/server.dart';
import 'package:adove/app/data/models/user.dart';
import 'package:graphql/client.dart';

class UserRepository {
  final GraphQLClient _client = getGraphQLClient();

  Future<User?> updateAddress(int id, String location, String street,
      String neighborhood, String number) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(updateUser),
        variables: <String, dynamic>{
          'id': id,
          'location': location,
          'street': street,
          'neighborhood': neighborhood,
          'number': number
        },
      );
      QueryResult result = await _client.mutate(options);
      final user = result.data!['updateUser'];
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<User?> updateFirebaseToken(int id, String firebaseToken) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(updateUserToken),
        variables: <String, dynamic>{'id': id, 'firebaseToken': firebaseToken},
      );
      QueryResult result = await _client.mutate(options);
      final user = result.data!['updateUser'];
      return user;
    } catch (e) {
      return null;
    }
  }
}
