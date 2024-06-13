import 'package:estudo_flutter/app/modules/login_page/show_dialog_esqueceu_senha.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _fbUrl =
    Uri.parse('https://pt-br.facebook.com/login/device-based/regular/login/');

final Uri _microsoftUrl = Uri.parse(
    'https://login.microsoftonline.com/common/oauth2/v2.0/authorize?scope=service%3A%3Aaccount.microsoft.com%3A%3AMBI_SSL+openid+profile+offline_access&response_type=code&client_id=81feaced-5ddd-41e7-8bef-3e20a2689bb7&redirect_uri=https%3A%2F%2Faccount.microsoft.com%2Fauth%2Fcomplete-signin-oauth&client-request-id=b53fb5d9-5b43-4752-b7e5-d5382a58e23e&x-client-SKU=MSAL.Desktop&x-client-Ver=4.59.1.0&x-client-OS=Windows+Server+2019+Datacenter&prompt=login&client_info=1&state=H4sIAAAAAAAEAAXByYKCIAAA0H-ZK4fBLe1IEmZBYm7lLfdK0hAn6-vnvR9x5NgJYPo0QZLd3LW_i8UbIm75h_5SLkNXVsC4QiAtooUjriNmvFXewKY4aPXa3hHtHucYfleuelq2qCp8GYIm0RBX0edBMuKthlyS8eJ_l5j6eGCrX7e7no9RS-BDpvm5awAG9Y5QvkZCC_srsvwl3EgR2Fkx1cN0Q9Qs08FwTjicI9p6HVYERVKxLWKOOMQquVnz4gDaWmbAYC_czPVC1Ivd_nNNQMJDr5_wi2ZfwTyrsSmSfQG4ZqS8Jvn9tdG_yzGtxSjIMkONp3Tz9ox7VYjx6Ogm6otnZY2001VKzr3BONa8zWXPtALpnxNDUoC03RZJ9jeZp7At22DO5FY9_NF7osh-JTGedPUqm7pOmF_NWTTKkjyIhL_2zz9tq4tOggEAAA&msaoauth2=true&lc=1046');

final Uri _googleUrl = Uri.parse(
    'https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Fscholar.google.com.br%2Fschhp%3Fhl%3Dpt-BR%26as_sdt%3D0%2C5&hl=pt-BR&ifkv=AS5LTAThH1x5BZLTJfPlFnV7dnuA9MJwcpKFflVCqiDa1lQDFqDzkIm7Ax0CLlQzT6UvurVkO08ysw&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S1829137144%3A1718299805435423&ddm=0');

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageScreenState createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _sizeAnimation;
  int _selectedIndex = 0;

  static const String _username = 'gustavo';
  static const String _password = '213243';

  // Controllers para os campos de login e senha
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _sizeAnimation = Tween<double>(begin: 20, end: 50).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  Future<void> _lauchUrlFb() async {
    if (await launchUrl(_fbUrl)) {
      throw Exception('Could not launch $_fbUrl');
    }
  }

  Future<void> _lauchUrlGoogle() async {
    if (await launchUrl(_googleUrl)) {
      throw Exception('Could not launch $_googleUrl');
    }
  }

  Future<void> _lauchUrlMicrosoft() async {
    if (await launchUrl(_microsoftUrl)) {
      throw Exception('Could not launch $_microsoftUrl');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    String enteredUsername = _usernameController.text.trim();
    String enteredPassword = _passwordController.text.trim();

    if (enteredUsername == _username && enteredPassword == _password) {
      Navigator.pushNamed(context, '/menu');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Credenciais inválidas. Tente novamente.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
          backgroundColor: const Color(0xff114E83),
          body: Center(
            child: SizedBox(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _opacityAnimation.value,
                            child: Text(
                              'Fast Delivery',
                              style: TextStyle(
                                fontSize: _sizeAnimation.value,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (_controller.isCompleted) {
                        _controller.reverse();
                      } else {
                        _controller.forward();
                      }
                    },
                    child: const Icon(Icons.play_arrow),
                  ),
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset('assets/LogoFood.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: _usernameController,
                          cursorColor: Colors.black,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            labelText: 'Login',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: _passwordController,
                          cursorColor: Colors.black,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                            labelText: 'senha',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 115,
                            color: Colors.white,
                            child: TextButton(
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all<Color>(
                                    const Color.fromARGB(255, 5, 5, 5)),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/registrar');
                              },
                              child: const Text('Registrar-se'),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 115,
                            color: Colors.white,
                            child: TextButton(
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all<Color>(
                                    const Color.fromARGB(255, 5, 5, 5)),
                              ),
                              onPressed: () => _login(),
                              child: const Text('Login'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          ShowDialogEsqueceuSenha.show(context);
                        },
                        child: const Text(
                          'Esqueceu a senha?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 255,
                              height: 55,
                              child: ElevatedButton.icon(
                                  iconAlignment: IconAlignment.start,
                                  onPressed: () async {
                                    await _lauchUrlFb();
                                  },
                                  icon: const FaIcon(FontAwesomeIcons.facebook),
                                  label: const Center(
                                    child: Text(
                                      'Logar com Facebook',
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      alignment: Alignment.centerLeft,
                                      shape: const LinearBorder())),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: 255,
                              height: 55,
                              child: ElevatedButton.icon(
                                  iconAlignment: IconAlignment.start,
                                  onPressed: () async {
                                    await _lauchUrlGoogle();
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.google,
                                  ),
                                  label: const Center(
                                      child: Text('Logar com Google')),
                                  style: ElevatedButton.styleFrom(
                                      alignment: Alignment.centerLeft,
                                      shape: const LinearBorder())),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: 255,
                              height: 55,
                              child: ElevatedButton.icon(
                                  iconAlignment: IconAlignment.start,
                                  onPressed: () async {
                                    await _lauchUrlMicrosoft();
                                  },
                                  icon:
                                      const FaIcon(FontAwesomeIcons.microsoft),
                                  label: const Center(
                                    child: Text(
                                      'Logar com Microsoft',
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      alignment: Alignment.centerLeft,
                                      shape: const LinearBorder())),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xff114E83),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.list_alt_outlined,
                  color: Colors.white,
                ),
                label: 'Pedidos',
              ),
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.search, color: Colors.white),
                  label: 'Buscar'),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.account_circle, color: Colors.white),
                label: 'Perfil',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          )),
    );
  }
}
