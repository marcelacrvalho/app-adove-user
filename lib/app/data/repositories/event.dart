import 'package:adove/app/data/graphql/mutations.dart';
import 'package:adove/app/data/graphql/queries.dart';
import 'package:adove/app/data/graphql/server.dart';
import 'package:adove/app/data/models/event.dart';
import 'package:graphql/client.dart';

class EventRepository {
  final GraphQLClient _client = getGraphQLClient();

  Future newEvent(int userId, int storeId, int jobId, int hourId, String currentDate) async {
    try {
      final MutationOptions options = MutationOptions(
      document: gql(createEvent),
      variables: <String, dynamic>{
        'user': userId,
        'store': storeId,
        'job': jobId,
        'hour': hourId,
        'date': currentDate
      },
    );
    QueryResult result = await _client.mutate(options);
    return result;
    } catch(e) {
      return null;
    }
  }

  Future <List<Event>?> getEvents(int userId) async{
    try {
      final QueryOptions options = QueryOptions(
        document: gql(getUserEvents),
        variables: {'user': userId},
      );
      final QueryResult result = await _client.query(options);
      List<Event> listEvents = result.data?['events'].map<Event>((map) {
        return Event.fromJson(map);
      }).toList();
      return listEvents;
    } catch (e) {
      return null;
    }
  }

  Future deleteEvent(int eventId) async {
    final MutationOptions options = MutationOptions(
      document: gql(deleteUserEvent),
      variables: <String, dynamic>{
        'id': eventId
      },
    );
    QueryResult result = await _client.mutate(options);
    return result;
  }
}