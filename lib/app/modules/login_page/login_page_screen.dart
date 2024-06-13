import 'package:estudo_flutter/app/modules/login_page/show_dialog_esqueceu_senha.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  @override
  void dispose() {
    _controller.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // Obter os valores dos campos de login e senha
    String enteredUsername = _usernameController.text.trim();
    String enteredPassword = _passwordController.text.trim();

    // Comparar com as credenciais "xumbadas" (hardcoded)
    if (enteredUsername == _username && enteredPassword == _password) {
      // Se as credenciais estiverem corretas, navegue para a próxima tela
      Navigator.pushNamed(context,
          '/menu'); // Substitua '/home' pelo nome da rota da próxima tela
    } else {
      // Caso contrário, exiba uma mensagem de erro (opcional)
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
    return Scaffold(
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
                                onPressed: () {},
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
                                onPressed: () {},
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
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.microsoft),
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
        ));
  }
}
