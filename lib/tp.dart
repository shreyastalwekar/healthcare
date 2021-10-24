import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSign = GoogleSignIn();
String namet, emailt, imageUrl;

Future<String> signInWIthGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSign.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  final AuthResult authResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  namet = user.displayName;
  emailt = user.email;
  imageUrl = user.photoUrl;

  final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
  assert(user.uid == currentUser.uid);
  return 'Sign in with Google succeeded: $user';
}

void signOutGoogle() async {
  await googleSign.signOut();
  print('User Signed Out');
}

Future getCurrentUser() async {
  return await FirebaseAuth.instance.currentUser();
}
