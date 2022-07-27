import 'package:graphql/client.dart';

GraphQLClient getGraphQLClient() {
  final Link _link = HttpLink(
    'https://adove-server.fedratecnologia.com.br',
  );

  return GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
}
