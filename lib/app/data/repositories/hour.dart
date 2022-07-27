import 'package:adove/app/data/graphql/queries.dart';
import 'package:adove/app/data/graphql/server.dart';
import 'package:adove/app/data/models/hour.dart';
import 'package:graphql/client.dart';

class HourRepository {
  final GraphQLClient _client = getGraphQLClient();

  Future<List<Hour>?> getHours(int idCurrentStore, String currentDate) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(getFreeHour),
        variables: {'store': idCurrentStore, 'date': currentDate},
      );
      final QueryResult result = await _client.query(options);
      List<Hour> listHours = result.data?['hours'].map<Hour>((map) {
        return Hour.fromJson(map);
      }).toList();
      return listHours;
    } catch (e) {
      return null;
    }
  }
}
