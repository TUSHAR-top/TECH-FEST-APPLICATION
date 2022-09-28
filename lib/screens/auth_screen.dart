import 'package:fest/screens/create_event.dart';
import 'package:fest/screens/event_categories.dart';
import 'package:fest/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _userNameController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  bool isEnabled = false;
  bool _showPass = false;
  bool isLoading = false;
  bool isLogin = true;

  void trySubmit() {
    FocusScope.of(context).unfocus();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _userNameController.addListener(() {
      checkButtonStatus();
    });
    _passwordController.addListener(() {
      checkButtonStatus();
    });
  }

  void checkButtonStatus() {
    if (_userNameController.text != '' && _passwordController.text != '') {
      setState(() {
        isEnabled = true;
      });
    }
    if (_userNameController.text == '' || _passwordController.text == '') {
      setState(() {
        isEnabled = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
  }

  Widget _bottom() {
    return Column(
      children: [
        const Divider(
          height: 3,
          thickness: 0.5,
          color: Colors.white38,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLogin ? 'Don\'t have an account' : 'Already have an account',
                style: const TextStyle(color: Colors.black, fontSize: 13),
              ),
              TextButton(
                onPressed: () => setState(() {
                  isLogin = !isLogin;
                }),
                child: Text(
                  isLogin ? 'Sign up.' : 'Sign in.',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.25),
            child: AppBar(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.purple,
            ),
          ),
        ),
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height * 0.25,
        //   decoration: const BoxDecoration(
        //       color: Colors.purple,
        //       borderRadius: BorderRadius.only(
        //           bottomLeft: Radius.circular(40),
        //           bottomRight: Radius.circular(40))),
        // ),
        Positioned(
          top: 110,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: isLogin
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            width: MediaQuery.of(context).size.width,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Fiesta',
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontFamily: 'Billabong',
                                        fontSize: 80,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 3),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: _userNameController,
                                    style: const TextStyle(color: Colors.black),
                                    cursorWidth: 0.5,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.purple[900]!)),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                        labelStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.purple[900],
                                            fontWeight: FontWeight.w400),
                                        labelText: 'Email'),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: _passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: !_showPass,
                                    style: const TextStyle(color: Colors.black),
                                    cursorWidth: 0.5,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15),
                                        suffixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: IconButton(
                                            splashRadius: 25,
                                            icon: Icon(
                                              _showPass
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: _showPass
                                                  ? Colors.blue
                                                  : Colors.black,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _showPass = !_showPass;
                                              });
                                            },
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.purple[900]!)),
                                        labelStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors.purple[900]!,
                                            fontWeight: FontWeight.w400),
                                        labelText: 'Password'),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.purple,
                                        disabledBackgroundColor:
                                            const Color.fromARGB(
                                                255, 26, 31, 93),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                      ),
                                      onPressed: isEnabled ? trySubmit : null,
                                      child: isLoading
                                          ? const SizedBox(
                                              height: 25,
                                              width: 25,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 3,
                                                color: Colors.white,
                                              ),
                                            )
                                          : Text(
                                              'Log in',
                                              style: TextStyle(
                                                color: isEnabled
                                                    ? Colors.white
                                                    : Colors.white38,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Forgot your login details?',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Get help logging in.',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    '  OR  ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              // BoxShadow(
                                              //   blurRadius: 6,
                                              //   color: Colors.black,
                                              //   spreadRadius: 0,
                                              // )
                                            ],
                                          ),
                                          child: const CircleAvatar(
                                            radius: 25,
                                            backgroundImage: AssetImage(
                                                'assets/Facebook-logo.png'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 6,
                                                  color: Colors.black,
                                                  spreadRadius: 0)
                                            ],
                                          ),
                                          child: const CircleAvatar(
                                            radius: 25,
                                            backgroundImage: AssetImage(
                                                'assets/Google-Icon-PNG-768x768.jpg'),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            width: MediaQuery.of(context).size.width,
                            child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Fiesta',
                                      style: TextStyle(
                                          color: Colors.purple,
                                          fontFamily: 'Billabong',
                                          fontSize: 80,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 3),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: _nameController,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      cursorWidth: 0.5,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.purple[900]!)),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 15),
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.purple[900],
                                              fontWeight: FontWeight.w400),
                                          labelText: 'Full Name'),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: _userNameController,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      cursorWidth: 0.5,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.purple[900]!)),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 15),
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.purple[900],
                                              fontWeight: FontWeight.w400),
                                          labelText: 'Email Address'),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      controller: _passwordController,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: !_showPass,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      cursorWidth: 0.5,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 15),
                                          suffixIcon: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: IconButton(
                                              splashRadius: 25,
                                              icon: Icon(
                                                _showPass
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: _showPass
                                                    ? Colors.blue
                                                    : Colors.black,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _showPass = !_showPass;
                                                });
                                              },
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.purple[900]!)),
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.purple[900]!,
                                              fontWeight: FontWeight.w400),
                                          labelText: 'Password'),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      height: 40,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.purple,
                                          disabledBackgroundColor:
                                              const Color.fromARGB(
                                                  255, 26, 31, 93),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                        ),
                                        onPressed: isEnabled ? trySubmit : null,
                                        child: isLoading
                                            ? const SizedBox(
                                                height: 25,
                                                width: 25,
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 3,
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Text(
                                                'Sign Up',
                                                style: TextStyle(
                                                  color: isEnabled
                                                      ? Colors.white
                                                      : Colors.white38,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                  ),
                  _bottom()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
