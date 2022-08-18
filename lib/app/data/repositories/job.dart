import 'package:adove/app/data/graphql/mutations.dart';
import 'package:adove/app/data/graphql/queries.dart';
import 'package:adove/app/data/graphql/server.dart';
import 'package:adove/app/data/models/job.dart';
import 'package:graphql/client.dart';

class JobRepository {
  final GraphQLClient _client = getGraphQLClient();

  Future<List<Job>?> getJobs(String localization, String category) async {
    try {
      final QueryOptions options = QueryOptions(
          document: gql(getJobsByLocationAndCategory),
          variables: {'location': localization, 'category': category});
      final QueryResult result = await _client.query(options);
      List<Job> listJobs = result.data?['jobsByLocation'].map<Job>((map) {
        return Job.fromJson(map);
      }).toList();
      return listJobs;
    } catch (e) {
      return null;
    }
  }

  Future<List<Job>?> getJobsSearch(String job, String location) async {
    try {
      final QueryOptions options = QueryOptions(
          document: gql(getJobSearch),
          variables: {'job': job, 'location': location});
      final QueryResult result = await _client.query(options);
      List<Job> listJobs = result.data?['jobsSearch'].map<Job>((map) {
        return Job.fromJson(map);
      }).toList();
      return listJobs;
    } catch (e) {
      return null;
    }
  }

  Future<List<Job>?> getJobsByDynamicLink(int id) async {
    try {
      final QueryOptions options =
          QueryOptions(document: gql(getJobsByStoreId), variables: {'id': id});
      final QueryResult result = await _client.query(options);
      List<Job> listJobs = result.data?['jobsByStore'].map<Job>((map) {
        return Job.fromJson(map);
      }).toList();
      return listJobs;
    } catch (e) {
      return null;
    }
  }
}
