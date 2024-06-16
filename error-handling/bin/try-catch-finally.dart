void main(List<String> args) {
  // try catch finally block
  try { // if you try to do whatever in this scope
    int? age; 
    int dogyears = 7;

    if (age == null) {
      throw Exception("Age is null");
    }

    print(age * dogyears);
  }
  catch (e) { // if there is a problem of any kind, you catch it right here in this catch all
    print('There was an error: ${e.toString()}');
  } // this is called a catch all because all exemptions will be caught by this 
  finally { // no matter what happens above, run this finally block 
    print('complete');
  }
}

// on NoSuchMethodError {
//     print('sorry there was an error');
//   }

// catching a specific error