// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   static const routeName = '/login';
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _userController = TextEditingController();
//   final _passController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _obscure = true;
//   bool _loading = false;

//   @override
//   void dispose() {
//     _userController.dispose();
//     _passController.dispose();
//     super.dispose();
//   }

//   void _tryLogin() {
//     if (!_formKey.currentState!.validate()) return;
//     setState(() => _loading = true);

//     // Simula autenticação (substitua pela sua lógica)
//     Future.delayed(const Duration(seconds: 1), () {
//       setState(() => _loading = false);
//       // Exemplo: navegar para outra tela após login bem-sucedido
//       Navigator.pushReplacementNamed(context, '/home');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       // para remover a barra padrão e deixar apenas status bar conforme imagem
//       backgroundColor: Colors.transparent,
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           // gradiente parecido com a imagem
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF140827), // top escuro
//               Color(0xFF2F2232), // meio
//               Color(0xFF5B3F46), // bottom mais quente
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Stack(
//             children: [
//               // (opcional) pequenas estrelas usando Positioned e Container - discreto
//               Positioned(
//                 top: 18,
//                 right: 18,
//                 child: Row(
//                   children: List.generate(3, (i) => Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                     child: Icon(Icons.wifi, color: Colors.white70, size: 0), // placeholder para status
//                   )),
//                 ),
//               ),

//               SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 18),
//                     // título
//                     Text(
//                       'Entre na sua conta',
//                       style: TextStyle(
//                         color: const Color(0xFFFFA617), // laranja
//                         fontSize: 28,
//                         fontWeight: FontWeight.w800,
//                         letterSpacing: 0.2,
//                       ),
//                     ),
//                     const SizedBox(height: 42),

//                     // formulário com campos arredondados brancos
//                     Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           // usuário
//                           _RoundedInput(
//                             controller: _userController,
//                             hintText: 'Digite seu nome de usuário',
//                             keyboardType: TextInputType.text,
//                             validator: (v) {
//                               if (v == null || v.trim().isEmpty) return 'Por favor insira o usuário';
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 18),

//                           // senha
//                           _RoundedInput(
//                             controller: _passController,
//                             hintText: 'Digite sua senha',
//                             obscureText: _obscure,
//                             suffix: IconButton(
//                               icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility,
//                                   color: Colors.black54),
//                               onPressed: () => setState(() => _obscure = !_obscure),
//                             ),
//                             validator: (v) {
//                               if (v == null || v.trim().isEmpty) return 'Por favor insira a senha';
//                               if (v.length < 4) return 'Senha muito curta';
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 36),

//                           // botão ENTRAR
//                           SizedBox(
//                             width: double.infinity,
//                             height: 64,
//                             child: ElevatedButton(
//                               onPressed: _loading ? null : _tryLogin,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(0xFF071315), // quase preto/vermelho da imagem
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(34),
//                                 ),
//                                 elevation: 14,
//                                 shadowColor: Colors.black54,
//                               ),
//                               child: _loading
//                                   ? const CircularProgressIndicator(color: Colors.orange)
//                                   : const Text(
//                                       'ENTRAR',
//                                       style: TextStyle(
//                                         color: Color(0xFFFFA617),
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w900,
//                                         letterSpacing: 1.2,
//                                       ),
//                                     ),
//                             ),
//                           ),

//                           const SizedBox(height: 20),

//                           // link para registrar (conecta register_screen.dart)
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 "Ainda não tem conta? ",
//                                 style: TextStyle(color: Colors.white70),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.pushNamed(context, '/register');
//                                 },
//                                 child: const Text(
//                                   "Registre-se",
//                                   style: TextStyle(
//                                     color: Color(0xFFFFA617),
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),

//                           const SizedBox(height: 20),

//                           // link (ou botão) para voltar / ir à splash se desejar
//                           GestureDetector(
//                             onTap: () {
//                               // exemplo: voltar para splash (substitui a rota atual)
//                               Navigator.pushReplacementNamed(context, '/splash');
//                             },
//                             child: const Text(
//                               "Voltar ao início",
//                               style: TextStyle(color: Colors.white38, decoration: TextDecoration.underline),
//                             ),
//                           ),
//                           const SizedBox(height: 40),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// Componente de campo arredondado branco para reutilizar
// class _RoundedInput extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final bool obscureText;
//   final Widget? suffix;
//   final TextInputType keyboardType;
//   final String? Function(String?)? validator;

//   const _RoundedInput({
//     required this.controller,
//     required this.hintText,
//     this.obscureText = false,
//     this.suffix,
//     this.keyboardType = TextInputType.text,
//     this.validator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(36),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.25),
//             offset: const Offset(0, 6),
//             blurRadius: 10,
//           )
//         ],
//       ),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText,
//         keyboardType: keyboardType,
//         validator: validator,
//         style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
//         decoration: InputDecoration(
//           contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
//           border: InputBorder.none,
//           suffixIcon: suffix == null ? null : Padding(padding: const EdgeInsets.only(right: 6.0), child: suffix),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _userCtrl = TextEditingController();
//   final _passCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _userCtrl.dispose();
//     _passCtrl.dispose();
//     super.dispose();
//   }

//   InputDecoration _pillDecoration(String hint) {
//     return InputDecoration(
//       hintText: hint,
//       hintStyle: const TextStyle(fontWeight: FontWeight.bold),
//       filled: true,
//       fillColor: Colors.white,
//       contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(40),
//         borderSide: BorderSide.none,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     const Color orange = Color(0xFFFFA726);
//     final Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFF0B1338), Color(0xFF3B2737)],
//           ),
//           image: DecorationImage(
//             image: AssetImage('assets/stars_bg.jpg'),
//             fit: BoxFit.cover,
//             opacity: 0.25,
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24.0),
//               child: Column(
//                 children: [
//                   SizedBox(height: size.height * 0.03),
//                   const Text(
//                     'Entre na sua conta',
//                     style: TextStyle(
//                         color: Color(0xFFFFA726),
//                         fontSize: 24,
//                         fontWeight: FontWeight.w800),
//                   ),
//                   SizedBox(height: size.height * 0.04),
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         // username
//                         TextFormField(
//                           controller: _userCtrl,
//                           decoration: _pillDecoration('Digite seu nome de usuário'),
//                           validator: (v) => (v == null || v.trim().isEmpty) ? 'Obrigatório' : null,
//                         ),
//                         const SizedBox(height: 18),

//                         // senha
//                         TextFormField(
//                           controller: _passCtrl,
//                           decoration: _pillDecoration('Digite sua senha'),
//                           obscureText: true,
//                           validator: (v) {
//                             if (v == null || v.trim().isEmpty) return 'Obrigatório';
//                             if (v.trim().length < 6) return 'Mínimo 6 caracteres';
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 28),

//                         SizedBox(
//                           width: double.infinity,
//                           height: 58,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 // TODO: autenticação real (API / Firebase)
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(content: Text('Entrando...')),
//                                 );
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.black,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(32),
//                               ),
//                               elevation: 8,
//                               shadowColor: Colors.black54,
//                             ),
//                             child: const Text(
//                               'ENTRAR',
//                               style: TextStyle(
//                                 color: orange,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 1.2,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 18),
//                         TextButton(
//                           onPressed: () {
//                             // voltar para registo
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => const RegisterScreenStub()),
//                             );
//                           },
//                           child: const Text(
//                             'Ainda não tem conta? Crie aqui',
//                             style: TextStyle(color: Colors.white70),
//                           ),
//                         ),
//                         SizedBox(height: size.height * 0.08),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// Pequeno stub para evitar import circular se preferires não importar RegisterScreen direto.
// /// Substitui por `RegisterScreen()` real se quiseres importar a classe.
// class RegisterScreenStub extends StatelessWidget {
//   const RegisterScreenStub({super.key});
//   @override
//   Widget build(BuildContext context) {
//     // volta para trás (ideal: navegue para RegisterScreen real)
//     return Scaffold(
//       appBar: AppBar(title: const Text('Registrar')),
//       body: Center(
//         child: TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text('Voltar'),
//         ),
//       ),
//     );
//   }
// }

// 

//com o Gemini

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  InputDecoration _pillDecoration(String hint, {Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontWeight: FontWeight.bold),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      suffixIcon: suffix,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide.none,
      ),
    );
  }

  // NOVA FUNÇÃO DE LOGIN
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // 1. Mostrar que está processando o login
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Autenticando...')),
      );

      // 2. Simular a chamada de API de login (ou a lógica real de autenticação)
      // Substitua o 'Future.delayed' pela sua lógica de API real.
      Future.delayed(const Duration(milliseconds: 1500), () {
        // Simulação de SUCESSO NO LOGIN:
        
        // 3. Navegar para a Homepage ('/home')
        // Usa pushNamedAndRemoveUntil para remover todas as telas anteriores 
        // (SplashScreen, Login, Register) da pilha.
        Navigator.pushNamedAndRemoveUntil(
          context, 
          '/home', 
          (Route<dynamic> route) => false,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color orange = Color(0xFFFFA726);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0B1338), Color(0xFF3B2737)],
          ),
          image: DecorationImage(
            image: AssetImage('assets/stars_bg.jpg'),
            fit: BoxFit.cover,
            opacity: 0.25,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36.0),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02),

                  // Título
                  const Text(
                    'Entre na sua conta',
                    style: TextStyle(
                        color: Color(0xFFFFA726),
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  ),

                  SizedBox(height: size.height * 0.04),

                  // Form com espaçamento maior entre campos
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _userCtrl,
                          decoration: _pillDecoration('Digite seu nome de usuário'),
                          validator: (v) =>
                              (v == null || v.trim().isEmpty) ? 'Obrigatório' : null,
                        ),

                        SizedBox(height: 26), // maior espaçamento

                        TextFormField(
                          controller: _passCtrl,
                          decoration: _pillDecoration(
                            'Digite sua senha',
                            suffix: IconButton(
                              icon: Icon(
                                _obscure ? Icons.visibility_off : Icons.visibility,
                                color: Colors.black45,
                              ),
                              onPressed: () => setState(() => _obscure = !_obscure),
                            ),
                          ),
                          obscureText: _obscure,
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) return 'Obrigatório';
                            if (v.trim().length < 6) return 'Mínimo 6 caracteres';
                            return null;
                          },
                        ),

                        SizedBox(height: 36), // espaço maior antes do botão

                        SizedBox(
                          width: double.infinity,
                          height: 58,
                          child: ElevatedButton(
                            onPressed: _handleLogin, // 👈 CHAMA A NOVA FUNÇÃO DE LOGIN
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              elevation: 8,
                              shadowColor: Colors.black54,
                            ),
                            child: const Text(
                              'ENTRAR',
                              style: TextStyle(
                                color: orange,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 22),

                        // link para registrar (vai para rota /register)
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/register'),
                          child: const Text.rich(
                            TextSpan(
                              text: 'Ainda não tem conta? ',
                              style: TextStyle(color: Colors.white70),
                              children: [
                                TextSpan(
                                  text: 'Registre-se',
                                  style: TextStyle(
                                      color: Color(0xFFFFA726),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 16),

                        // voltar ao início
                        TextButton(
                          onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
                          child: const Text(
                            'Voltar ao início',
                            style: TextStyle(color: Colors.white54),
                          ),
                        ),

                        SizedBox(height: size.height * 0.06),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
