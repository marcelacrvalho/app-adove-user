const String createUser = r'''
 mutation NewUser(
   $email: String, $password: String, $name: String,
   $location: String, $street: String, $neighborhood: String, 
   $number: String, $firebaseToken: String
   ){
  createUser(
    data: {
     email: $email, 
      password: $password,
      name: $name,
      location: $location,
      street: $street,
      neighborhood: $neighborhood,
      number: $number
      firebaseToken: $firebaseToken
    }
  ) { id name email location street neighborhood number firebaseToken }
}
''';

const String updateUser = r'''
 mutation UpdateUser ($id: Int!, $location: String, 
 $neighborhood: String, $street: String, $number: String) {
  updateUser(
    id: $id,
    data: {
      location: $location,
      neighborhood: $neighborhood,
      street: $street,
      number: $number,
    }
  ) { id }
}
''';

const String updateUserToken = r'''
mutation UpdateUserToken($id: Int!, $firebaseToken: String) {
  updateUser(
    id: $id,
    data: {
      firebaseToken: $firebaseToken
    }
  ) { id }
}
''';

const String login = r'''
  mutation Login ($email: String, $password: String){
  loginUser(
    data: {
      email: $email,
      password: $password
    }
  ) { id name email location street neighborhood number firebaseToken }
}
''';

const String createEvent = r'''
 mutation NewEvent($job: Int, $store: Int, $user: Int, $hour: Int, $date: GraphQLDate){
  createEvent(
    data: {
      job: $job,
      store: $store,
      user: $user,
      hour: $hour,
      date: $date
    }
  ) { id }
}
''';

const String deleteUserEvent = r'''
 mutation DeleteEvent($id: Int){
  deleteEvent(
    filter: {
      id: $id
    }
  )
}
''';

const String getJobsByStoreId = r'''
query GetJobsByStoreId($id: Int) {
  jobsByStore(
    filter: {
      store: $id,
    }
  ) { id job description price store { name }
  }
}
''';
