// // lib/screens/register_login.dart

// import 'package:flutter/material.dart';

// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Container com BoxDecoration para criar o gradiente de fundo roxo escuro
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF0D0221), // Roxo escuro
//               Color(0xFF2C0B4F), // Roxo ligeiramente mais claro
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 // Barra de Status Falsa (opcional, para replicar o topo da imagem)
//                 const Padding(
//                   padding: EdgeInsets.only(bottom: 20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text('10:15', style: TextStyle(color: Colors.white, fontSize: 16)),
//                       SizedBox(width: 15),
//                       Icon(Icons.wifi, color: Colors.white),
//                       SizedBox(width: 5),
//                       Icon(Icons.signal_cellular_4_bar, color: Colors.white),
//                       SizedBox(width: 5),
//                       Icon(Icons.battery_full, color: Colors.white),
//                     ],
//                   ),
//                 ),

//                 // Título "Crie sua conta"
//                 const Text(
//                   'Crie sua conta',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color(0xFFFFC700), // Amarelo/Dourado
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 40),

//                 // Campos de entrada
//                 _buildInput(label: 'Digite seu nome de usuário'),
//                 const SizedBox(height: 20),
//                 _buildInput(label: 'Digite seu e-mail'),
//                 const SizedBox(height: 20),
//                 _buildInput(label: 'Confirme seu e-mail'),
//                 const SizedBox(height: 20),
//                 _buildInput(label: 'Digite sua senha', isPassword: true),
//                 const SizedBox(height: 20),
//                 _buildInput(label: 'Confirme sua senha', isPassword: true),
                
//                 const SizedBox(height: 40),

//                 // Botão "CRIE SUA CONTA"
//                 ElevatedButton(
//                   onPressed: () {
//                     // Lógica de registro será adicionada aqui
//                     print('Registro concluído!');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF0F0F0F), // Fundo do botão
//                     minimumSize: const Size(double.infinity, 60),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     side: const BorderSide(
//                         color: Color(0xFFFFC700), width: 2), // Borda dourada
//                   ),
//                   child: const Text(
//                     'CRIE SUA CONTA',
//                     style: TextStyle(
//                       color: Color(0xFFFFC700), // Cor do texto
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Widget auxiliar para criar os campos de entrada (TextFields)
//   Widget _buildInput({required String label, bool isPassword = false}) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: Colors.transparent, // Fundo transparente
//         borderRadius: BorderRadius.circular(30),
//         border: Border.all(color: Colors.white, width: 0.5),
//       ),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: TextField(
//             obscureText: isPassword,
//             style: const TextStyle(color: Colors.white, fontSize: 18),
//             textAlign: TextAlign.center,
//             decoration: InputDecoration(
//               hintText: label,
//               hintStyle: const TextStyle(color: Colors.white70, fontSize: 18),
//               border: InputBorder.none,
//               contentPadding: const EdgeInsets.only(bottom: 5)
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _userCtrl = TextEditingController();
//   final _emailCtrl = TextEditingController();
//   final _confirmEmailCtrl = TextEditingController();
//   final _passCtrl = TextEditingController();
//   final _confirmPassCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _userCtrl.dispose();
//     _emailCtrl.dispose();
//     _confirmEmailCtrl.dispose();
//     _passCtrl.dispose();
//     _confirmPassCtrl.dispose();
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
//                     'Crie sua conta',
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
//                         // nome de usuário
//                         TextFormField(
//                           controller: _userCtrl,
//                           decoration:
//                               _pillDecoration('Digite seu nome de usuário'),
//                           validator: (v) =>
//                               (v == null || v.trim().isEmpty) ? 'Obrigatório' : null,
//                         ),
//                         const SizedBox(height: 18),

//                         // e-mail
//                         TextFormField(
//                           controller: _emailCtrl,
//                           decoration: _pillDecoration('Digite seu e-mail'),
//                           keyboardType: TextInputType.emailAddress,
//                           validator: (v) {
//                             if (v == null || v.trim().isEmpty) return 'Obrigatório';
//                             if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$')
//                                 .hasMatch(v)) return 'E-mail inválido';
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 18),

//                         // confirmar e-mail
//                         TextFormField(
//                           controller: _confirmEmailCtrl,
//                           decoration: _pillDecoration('Confirme seu e-mail'),
//                           keyboardType: TextInputType.emailAddress,
//                           validator: (v) {
//                             if (v == null || v.trim().isEmpty) return 'Obrigatório';
//                             if (v.trim() != _emailCtrl.text.trim()) return 'E-mails não coincidem';
//                             return null;
//                           },
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
//                         const SizedBox(height: 18),

//                         // confirmar senha
//                         TextFormField(
//                           controller: _confirmPassCtrl,
//                           decoration: _pillDecoration('Confirme sua senha'),
//                           obscureText: true,
//                           validator: (v) {
//                             if (v == null || v.trim().isEmpty) return 'Obrigatório';
//                             if (v.trim() != _passCtrl.text.trim()) return 'Senhas não coincidem';
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 28),

//                         // botão principal
//                         SizedBox(
//                           width: double.infinity,
//                           height: 58,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 // TODO: lógica de registo (API / Firebase)
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(content: Text('Registrando...')),
//                                 );
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.black,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(32)),
//                               elevation: 8,
//                               shadowColor: Colors.black54,
//                             ),
//                             child: const Text(
//                               'CRIE SUA CONTA',
//                               style: TextStyle(
//                                   color: orange,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                   letterSpacing: 1.2),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 18),
//                         // voltar / link para login
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text(
//                             'Já possui uma conta? Entre aqui',
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

// import 'package:flutter/material.dart';
// import 'login_screen.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _userCtrl = TextEditingController();
//   final _emailCtrl = TextEditingController();
//   final _confirmEmailCtrl = TextEditingController();
//   final _passCtrl = TextEditingController();
//   final _confirmPassCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _userCtrl.dispose();
//     _emailCtrl.dispose();
//     _confirmEmailCtrl.dispose();
//     _passCtrl.dispose();
//     _confirmPassCtrl.dispose();
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
//                     'Crie sua conta',
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
//                         // nome de usuário
//                         TextFormField(
//                           controller: _userCtrl,
//                           decoration:
//                               _pillDecoration('Digite seu nome de usuário'),
//                           validator: (v) =>
//                               (v == null || v.trim().isEmpty) ? 'Obrigatório' : null,
//                         ),
//                         const SizedBox(height: 18),

//                         // e-mail
//                         TextFormField(
//                           controller: _emailCtrl,
//                           decoration: _pillDecoration('Digite seu e-mail'),
//                           keyboardType: TextInputType.emailAddress,
//                           validator: (v) {
//                             if (v == null || v.trim().isEmpty) return 'Obrigatório';
//                             if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$')
//                                 .hasMatch(v)) return 'E-mail inválido';
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 18),

//                         // confirmar e-mail
//                         TextFormField(
//                           controller: _confirmEmailCtrl,
//                           decoration: _pillDecoration('Confirme seu e-mail'),
//                           keyboardType: TextInputType.emailAddress,
//                           validator: (v) {
//                             if (v == null || v.trim().isEmpty) return 'Obrigatório';
//                             if (v.trim() != _emailCtrl.text.trim()) return 'E-mails não coincidem';
//                             return null;
//                           },
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
//                         const SizedBox(height: 18),

//                         // confirmar senha
//                         TextFormField(
//                           controller: _confirmPassCtrl,
//                           decoration: _pillDecoration('Confirme sua senha'),
//                           obscureText: true,
//                           validator: (v) {
//                             if (v == null || v.trim().isEmpty) return 'Obrigatório';
//                             if (v.trim() != _passCtrl.text.trim()) return 'Senhas não coincidem';
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 28),

//                         // botão principal
//                         SizedBox(
//                           width: double.infinity,
//                           height: 58,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 // TODO: lógica de registo (API / Firebase)
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(content: Text('Registrando...')),
//                                 );
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.black,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(32)),
//                               elevation: 8,
//                               shadowColor: Colors.black54,
//                             ),
//                             child: const Text(
//                               'CRIE SUA CONTA',
//                               style: TextStyle(
//                                   color: orange,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                   letterSpacing: 1.2),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 18),
//                         // navegar para login
//                         TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => const LoginScreen()),
//                             );
//                           },
//                           child: const Text(
//                             'Já possui uma conta? Entre aqui',
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

import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _confirmEmailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();

  @override
  void dispose() {
    _userCtrl.dispose();
    _emailCtrl.dispose();
    _confirmEmailCtrl.dispose();
    _passCtrl.dispose();
    _confirmPassCtrl.dispose();
    super.dispose();
  }

  InputDecoration _pillDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontWeight: FontWeight.bold),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide.none,
      ),
    );
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
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 24.0),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.03),
                  const Text(
                    'Crie sua conta',
                    style: TextStyle(
                        color: Color(0xFFFFA726),
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: size.height * 0.04),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _userCtrl,
                          decoration:
                              _pillDecoration('Digite seu nome de usuário'),
                          validator: (v) =>
                              (v == null || v.trim().isEmpty) ? 'Obrigatório' : null,
                        ),
                        const SizedBox(height: 18),
                        TextFormField(
                          controller: _emailCtrl,
                          decoration: _pillDecoration('Digite seu e-mail'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) return 'Obrigatório';
                            if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$')
                                .hasMatch(v)) {
                              return 'E-mail inválido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),
                        TextFormField(
                          controller: _confirmEmailCtrl,
                          decoration: _pillDecoration('Confirme seu e-mail'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) return 'Obrigatório';
                            if (v.trim() != _emailCtrl.text.trim()) return 'E-mails não coincidem';
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),
                        TextFormField(
                          controller: _passCtrl,
                          decoration: _pillDecoration('Digite sua senha'),
                          obscureText: true,
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) return 'Obrigatório';
                            if (v.trim().length < 6) return 'Mínimo 6 caracteres';
                            return null;
                          },
                        ),
                        const SizedBox(height: 18),
                        TextFormField(
                          controller: _confirmPassCtrl,
                          decoration: _pillDecoration('Confirme sua senha'),
                          obscureText: true,
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) return 'Obrigatório';
                            if (v.trim() != _passCtrl.text.trim()) return 'Senhas não coincidem';
                            return null;
                          },
                        ),
                        const SizedBox(height: 28),
                        SizedBox(
                          width: double.infinity,
                          height: 58,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Registrando...')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              elevation: 8,
                              shadowColor: Colors.black54,
                            ),
                            child: const Text(
                              'CRIE SUA CONTA',
                              style: TextStyle(
                                  color: orange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 1.2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Já possui uma conta? ',
                                  style: TextStyle(color: Colors.white70)
                                ),
                                TextSpan(
                                  text: 'Entre aqui',
                                  style: TextStyle(
                                    color: Color(0xFFFFA726),
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ]
                            )
                            
                        ),
                        ),
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
