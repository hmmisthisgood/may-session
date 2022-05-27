/// This is main
main() {
  final interest = simpleInterest(
    2,
    10,
    1000,
    "ram bahaur",
  );
  print(interest);

  final i = si(
    "Nabiol bank",
    t: 4,
    r: 15,
    p: 1111,
  );
}

// void
// int , String, ....

/// function with positional argumnets. where position of
/// values matter
num simpleInterest(num p, num r, num t, String person) {
  final interest = (p * t * r) / 100;
  print(interest);
  return interest;
}

/// function with named arguments.
num si(String creditor,
    {required num p, required num t, required num r, String? person}) {
  // num , num?
  final interest = (p * t * r) / 100;
  print(interest);
  return interest;
}
