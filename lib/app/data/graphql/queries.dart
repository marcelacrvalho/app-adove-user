const String getUserEvents = r'''
  query GetUserEvents($user: Int) {
  events(
    filter: {
      user: $user
    }
  ) { id date hour { hour }
    	job { job price }
  		store { name payment location street neighborhood number firebaseToken }
  }
}
''';

const String getJobsByLocationAndCategory = r'''
  query JobsLocation($location: String, $category: String) {
  jobsByLocation(
    filter: {
      location: $location,
      category: $category
    }
  ) { id job price description 
  store { id name homecare location payment open street neighborhood number } }
}
''';

const String getJobSearch = r'''
  query JobsSearch($location: String, $job: String) {
  jobsSearch(
    filter: {
      location: $location,
      job: $job
    }
  ) { id job price description 
    	store { id name payment location street neighborhood number homecare open }
  }
}
''';

const String getJobId = r'''
  query GetJobs($id: Int) {
  job(
    filter: {
    id: $id,
    }) 
    { id job description price
      store { id name homecare location payment open street neighborhood number }
    }
}
''';

const String getFreeHour = r'''
 query GetFreeHour($date: String, $store: Int) {
  hours(
    filter: {
      date: $date,
      store: $store
    }
  ) { id hour }
}
''';
