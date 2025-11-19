// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Morpheus App',
//       theme: ThemeData(
//         useMaterial3: true,
//         // podes definir colorScheme / fonts aqui
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const Color orange = Color(0xFFFFA726); // cor de destaque
//     const Color black = Colors.black;
//     final Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: const LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF0B1338),
//               Color(0xFF3B2737),
//             ],
//           ),
//           // usa a imagem de estrelas diretamente
//           image: const DecorationImage(
//             image: AssetImage('assets/stars_bg.jpg'),
//             fit: BoxFit.cover,
//             opacity: 0.25,
//           ),
//         ),
//         child: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 28.0, vertical: 36),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: size.height * 0.04),

//                     // Logo com glow e fallback
//                     Container(
//                       width: size.width * 0.45,
//                       height: size.width * 0.45,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: orange.withOpacity(0.35),
//                             blurRadius: 40,
//                             spreadRadius: 8,
//                           ),
//                         ],
//                       ),
//                       child: ClipOval(
//                         child: Container(
//                           color: Colors.transparent,
//                           alignment: Alignment.center,
//                           child: Image.asset(
//                             'assets/moon_logo.png',
//                             fit: BoxFit.contain,
//                             // fallback para evitar o "X" se o asset falhar
//                             errorBuilder: (context, error, stackTrace) {
//                               return Icon(
//                                 Icons.nightlight_round,
//                                 size: size.width * 0.28,
//                                 color: orange,
//                                 semanticLabel: 'Ícone de lua (fallback)',
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 28),

//                     const Text(
//                       'Bem-vindo ao Morpheus', // com hífen
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFFFFA726),
//                         fontSize: 26,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),

//                     const SizedBox(height: 8),

//                     const Text(
//                       'Cuide de sua rotina de sono!',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white70,
//                         fontSize: 14,
//                       ),
//                     ),

//                     SizedBox(height: size.height * 0.06),

//                     SizedBox(
//                       width: double.infinity,
//                       height: 58,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // navegar para registo
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: black,
//                           elevation: 8,
//                           shadowColor: Colors.black54,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(32),
//                           ),
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                         ),
//                         child: const Text(
//                           'REGISTRE-SE',
//                           style: TextStyle(
//                             color: Color(0xFFFFA726),
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 1.2,
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 18),

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'Já possui uma conta? ',
//                           style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 13,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             // navegar para login
//                           },
//                           child: const Text(
//                             'Entre aqui',
//                             style: TextStyle(
//                               color: Color(0xFFFFA726),
//                               fontSize: 13,
//                               fontWeight: FontWeight.bold,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     SizedBox(height: size.height * 0.10),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Morpheus App',
//       theme: ThemeData(
//         useMaterial3: true,
//       ),
//       // A tela inicial continua sendo a SplashScreen
//       home: const SplashScreen(),
//     );
//   }
// }

// // -----------------------------------------------------
// // 1. SPLASH SCREEN (Tela de Boas-Vindas)
// // -----------------------------------------------------

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const Color orange = Color(0xFFFFA726); // cor de destaque
//     const Color black = Colors.black;
//     final Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: const LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF0B1338),
//               Color(0xFF3B2737),
//             ],
//           ),
//           // Nota: Você deve ter o arquivo 'assets/stars_bg.jpg' configurado no pubspec.yaml
//           image: const DecorationImage(
//             image: AssetImage('assets/stars_bg.jpg'),
//             fit: BoxFit.cover,
//             opacity: 0.25,
//           ),
//         ),
//         child: SafeArea(
//           child: Center(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 36),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: size.height * 0.04),

//                     // Logo com glow e fallback
//                     Container(
//                       width: size.width * 0.45,
//                       height: size.width * 0.45,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: orange.withOpacity(0.35),
//                             blurRadius: 40,
//                             spreadRadius: 8,
//                           ),
//                         ],
//                       ),
//                       child: ClipOval(
//                         child: Container(
//                           color: Colors.transparent,
//                           alignment: Alignment.center,
//                           // Nota: Você deve ter o arquivo 'assets/moon_logo.png' configurado no pubspec.yaml
//                           child: Image.asset(
//                             'assets/moon_logo.png',
//                             fit: BoxFit.contain,
//                             errorBuilder: (context, error, stackTrace) {
//                               return Icon(
//                                 Icons.nightlight_round,
//                                 size: size.width * 0.28,
//                                 color: orange,
//                                 semanticLabel: 'Ícone de lua (fallback)',
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 28),

//                     const Text(
//                       'Bem-vindo ao Morpheus',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFFFFA726),
//                         fontSize: 26,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),

//                     const SizedBox(height: 8),

//                     const Text(
//                       'Cuide de sua rotina de sono!',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white70,
//                         fontSize: 14,
//                       ),
//                     ),

//                     SizedBox(height: size.height * 0.06),

//                     // BOTÃO REGISTRE-SE (Com navegação)
//                     SizedBox(
//                       width: double.infinity,
//                       height: 58,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // *** NAVEGAÇÃO PARA A TELA DE REGISTRO ***
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const RegisterScreen(),
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: black,
//                           elevation: 8,
//                           shadowColor: Colors.black54,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(32),
//                           ),
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                         ),
//                         child: const Text(
//                           'REGISTRE-SE',
//                           style: TextStyle(
//                             color: Color(0xFFFFA726),
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 1.2,
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 18),

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'Já possui uma conta? ',
//                           style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 13,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             // TODO: Implementar navegação para Login
//                           },
//                           child: const Text(
//                             'Entre aqui',
//                             style: TextStyle(
//                               color: Color(0xFFFFA726),
//                               fontSize: 13,
//                               fontWeight: FontWeight.bold,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     SizedBox(height: size.height * 0.10),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // -----------------------------------------------------
// // 2. REGISTER SCREEN (Tela de Registro)
// // -----------------------------------------------------

// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Scaffold fornece a estrutura básica de design visual
//     return Scaffold(
//       // Container com BoxDecoration para criar o gradiente de fundo roxo escuro
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             // Cores baseadas na imagem (roxo escuro/preto)
//             colors: [
//               Color(0xFF0D0221), // Cor mais escura
//               Color(0xFF2C0B4F), // Cor mais clara para o efeito de gradiente
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         // SafeArea garante que o conteúdo não invada áreas como a barra de status
//         child: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
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
//                 const SizedBox(height: 40), // Espaço após o título

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
                
//                 const SizedBox(height: 40), // Espaço antes do botão final

//                 // Botão "CRIE SUA CONTA"
//                 ElevatedButton(
//                   onPressed: () {
//                     // Lógica de registro será adicionada aqui (Exemplo: enviar dados para um servidor)
//                     print('Botão CRIE SUA CONTA pressionado!');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF0F0F0F), // Cor de fundo do botão (preto/muito escuro)
//                     minimumSize: const Size(double.infinity, 60), // Largura total e altura
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30), // Borda arredondada
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
//       height: 60, // Altura padrão para os botões de entrada
//       decoration: BoxDecoration(
//         color: Colors.transparent, // Fundo transparente
//         borderRadius: BorderRadius.circular(30),
//         border: Border.all(color: Colors.white, width: 0.5), // Borda sutil
//       ),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: TextField(
//             obscureText: isPassword,
//             style: const TextStyle(color: Colors.white, fontSize: 18),
//             textAlign: TextAlign.center, // Centraliza o texto digitado
//             decoration: InputDecoration(
//               hintText: label,
//               hintStyle: const TextStyle(color: Colors.white70, fontSize: 18),
//               border: InputBorder.none, // Remove a borda padrão do TextField
//               contentPadding: const EdgeInsets.only(bottom: 5)
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// 

// import 'package:flutter/material.dart';
// import 'screens/register_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Morpheus App',
//       theme: ThemeData(useMaterial3: true),
//       home: const SplashScreen(),
//     );
//   }
// }

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const Color orange = Color(0xFFFFA726);
//     const Color black = Colors.black;
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
//           child: Center(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 28.0, vertical: 36),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: size.height * 0.04),
//                     // logo
//                     Container(
//                       width: size.width * 0.45,
//                       height: size.width * 0.45,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: orange.withOpacity(0.35),
//                             blurRadius: 40,
//                             spreadRadius: 8,
//                           ),
//                         ],
//                       ),
//                       child: ClipOval(
//                         child: Image.asset(
//                           'assets/moon_logo.png',
//                           fit: BoxFit.contain,
//                           errorBuilder: (c, e, s) =>
//                               Icon(Icons.nightlight_round, color: orange, size: size.width * 0.28),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 28),
//                     const Text(
//                       'Bem-vindo ao Morpheus',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Color(0xFFFFA726),
//                           fontSize: 26,
//                           fontWeight: FontWeight.w800),
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       'Cuide de sua rotina de sono!',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.white70, fontSize: 14),
//                     ),
//                     SizedBox(height: size.height * 0.06),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 58,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // navega para a tela de registo
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const RegisterScreen()),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: black,
//                           elevation: 8,
//                           shadowColor: Colors.black54,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(32)),
//                         ),
//                         child: const Text(
//                           'REGISTRE-SE',
//                           style: TextStyle(
//                               color: Color(0xFFFFA726),
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 1.2),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 18),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text('Já possui uma conta? ',
//                             style: TextStyle(color: Colors.white70, fontSize: 13)),
//                         GestureDetector(
//                           onTap: () {
//                             // TODO: navegar para login
//                           },
//                           child: const Text('Entre aqui',
//                               style: TextStyle(
//                                   color: Color(0xFFFFA726),
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.bold,
//                                   decoration: TextDecoration.underline)),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: size.height * 0.10),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'screens/register_screen.dart';
// import 'screens/login_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Morpheus App',
//       theme: ThemeData(useMaterial3: true),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const SplashScreen(),
//         '/register': (context) => const RegisterScreen(),
//         '/login': (context) => const LoginScreen(),
//       },
//     );
//   }
// }

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const Color orange = Color(0xFFFFA726);
//     const Color black = Colors.black;
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
//           child: Center(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 28.0, vertical: 36),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: size.height * 0.04),
//                     // logo
//                     Container(
//                       width: size.width * 0.45,
//                       height: size.width * 0.45,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: orange.withOpacity(0.35),
//                             blurRadius: 40,
//                             spreadRadius: 8,
//                           ),
//                         ],
//                       ),
//                       child: ClipOval(
//                         child: Image.asset(
//                           'assets/moon_logo.png',
//                           fit: BoxFit.contain,
//                           errorBuilder: (c, e, s) =>
//                               Icon(Icons.nightlight_round, color: orange, size: size.width * 0.28),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 28),
//                     const Text(
//                       'Bem-vindo ao Morpheus',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Color(0xFFFFA726),
//                           fontSize: 26,
//                           fontWeight: FontWeight.w800),
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       'Cuide de sua rotina de sono!',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.white70, fontSize: 14),
//                     ),
//                     SizedBox(height: size.height * 0.06),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 58,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/register');
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: black,
//                           elevation: 8,
//                           shadowColor: Colors.black54,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(32)),
//                         ),
//                         child: const Text(
//                           'REGISTRE-SE',
//                           style: TextStyle(
//                               color: Color(0xFFFFA726),
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 1.2),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 18),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text('Já possui uma conta? ',
//                             style: TextStyle(color: Colors.white70, fontSize: 13)),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/login');
//                           },
//                           child: const Text('Entre aqui',
//                               style: TextStyle(
//                                   color: Color(0xFFFFA726),
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.bold,
//                                   decoration: TextDecoration.underline)),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: size.height * 0.10),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// Importação necessária para inicializar o locale
import 'package:intl/date_symbol_data_local.dart'; 

// Importações das suas telas (localizadas em lib/screens/)
import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/homepage.dart'; // 👈 Importação da tela de clima

// 🚨 CORREÇÃO CRÍTICA PARA O LocaleDataException
void main() async {
  // Garante que o binding do Flutter esteja inicializado antes de qualquer chamada
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa os dados de data/hora para o locale 'pt_BR'
  await initializeDateFormatting('pt_BR', null);
  
  // Define o locale padrão para o DateFormat e widgets
  Intl.defaultLocale = 'pt_BR'; 
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Morpheus App',
      // Definindo o tema Dark (escuro) para combinar com o design
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        // Você pode ajustar o primarySwatch se desejar
      ), 
      initialRoute: '/',
      routes: {
        // Rotas de autenticação
        '/': (context) => const SplashScreen(),
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        
        // Rota principal da aplicação (Homepage do clima)
        '/home': (context) => const MorpheusHomePage(), 
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color orange = Color(0xFFFFA726);
    const Color black = Colors.black;
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
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 36),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.04),
                    // logo
                    Container(
                      width: size.width * 0.45,
                      height: size.width * 0.45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: orange.withOpacity(0.35),
                            blurRadius: 40,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/moon_logo.png',
                          fit: BoxFit.contain,
                          errorBuilder: (c, e, s) =>
                              Icon(Icons.nightlight_round, color: orange, size: size.width * 0.28),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Bem-vindo ao Morpheus',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFFFFA726),
                          fontSize: 26,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Cuide de sua rotina de sono!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    SizedBox(height: size.height * 0.06),
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: black,
                          elevation: 8,
                          shadowColor: Colors.black54,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                        ),
                        child: const Text(
                          'REGISTRE-SE',
                          style: TextStyle(
                              color: Color(0xFFFFA726),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Já possui uma conta? ',
                            style: TextStyle(color: Colors.white70, fontSize: 13)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text('Entre aqui',
                              style: TextStyle(
                                  color: Color(0xFFFFA726),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}