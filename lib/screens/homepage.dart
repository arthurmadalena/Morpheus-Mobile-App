// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';
// import 'dart:async';

// // 1. Definição da Classe Stateful
// class MorpheusHomePage extends StatefulWidget {
//   const MorpheusHomePage({super.key});

//   @override
//   State<MorpheusHomePage> createState() => _MorpheusHomePageState();
// }

// class _MorpheusHomePageState extends State<MorpheusHomePage> {
//   // Sua chave de API integrada
//   static const String API_KEY = 'f12a64ba4d5a0b79a68eb06c23fa8826'; 
//   static const String CITY_API = 'Cachoeirinha,br'; 
  
//   // Variáveis de estado para armazenar os dados e controlar o carregamento
//   String _city = "Carregando...";
//   int _currentTemp = 0;
//   String _condition = "Aguardando dados...";
//   int _maxTemp = 0;
//   int _minTemp = 0;
//   String _dateTime = "Carregando...";
//   String _currentTime = "00:00"; 
//   bool _isLoading = true; // Flag para indicar se os dados estão sendo carregados

//   // Definição da cor de destaque (Amarelo/Laranja)
//   final Color accentColor = const Color(0xFFF7A94A);

//   @override
//   void initState() {
//     super.initState();
//     // Garante que o locale 'pt_BR' esteja disponível para o DateFormat
//     Intl.defaultLocale = 'pt_BR';
    
//     _fetchWeatherData(); 
//     _updateTime();       
    
//     // Timer para atualizar a hora a cada minuto
//     Timer.periodic(const Duration(minutes: 1), (Timer t) => _updateTime());
//   }

//   // --- Funções de API e Data/Hora ---

//   Future<void> _fetchWeatherData() async {
//     setState(() { _isLoading = true; });

//     final Uri uri = Uri.parse(
//       'https://api.openweathermap.org/data/2.5/weather?q=$CITY_API&appid=$API_KEY&units=metric&lang=pt'
//     );

//     try {
//       final response = await http.get(uri);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
        
//         setState(() {
//           _city = data['name'] ?? "Local Desconhecido";
//           _currentTemp = data['main']['temp'].round();
//           _maxTemp = data['main']['temp_max'].round();
//           _minTemp = data['main']['temp_min'].round();
          
//           String rawCondition = data['weather'][0]['description'] ?? 'Desconhecido';
//           _condition = rawCondition[0].toUpperCase() + rawCondition.substring(1);
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _city = "Erro ${response.statusCode}";
//           _condition = "Falha ao carregar clima";
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _city = "Erro de Conexão";
//         _condition = "Verifique a internet";
//         _isLoading = false;
//       });
//     }
//   }

//   void _updateTime() {
//     final now = DateTime.now();
    
//     final dateFormat = DateFormat('EEEE', 'pt_BR');
//     final formattedDate = dateFormat.format(now);
    
//     // Formato da Hora com AM/PM (Ex: 10:15 AM)
//     final timeFormat = DateFormat('hh:mm a', 'en_US'); 
//     final formattedTime = timeFormat.format(now);

//     // Formato da Hora para a barra de status (Ex: 10:15)
//     final statusBarTimeFormat = DateFormat('HH:mm');
//     final formattedStatusBarTime = statusBarTimeFormat.format(now);

//     setState(() {
//       _dateTime = "${formattedDate[0].toUpperCase()}${formattedDate.substring(1)}, $formattedTime";
//       _currentTime = formattedStatusBarTime;
//     });
//   }


//   // --- Estrutura da UI (Build Method) ---
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF3A2E7C), 
//               Color(0xFF2A1A5C), 
//               Color(0xFF170E30), 
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 _buildStatusBarMock(),
//                 const SizedBox(height: 10),
//                 _buildHeader(),
//                 const SizedBox(height: 30),
//                 // Exibe um indicador de carregamento ou as informações do clima
//                 _isLoading 
//                     ? const Padding(
//                         padding: EdgeInsets.only(top: 80.0),
//                         child: Center(child: CircularProgressIndicator(color: Color(0xFFF7A94A))),
//                       )
//                     : _buildWeatherInfo(),
//                 const SizedBox(height: 50),
//                 _buildButton("RELATÓRIO NOTURNO"),
//                 const SizedBox(height: 20),
//                 _buildButton("RELATÓRIO SEMANAL"),
//                 const SizedBox(height: 20),
//                 _buildButton("ALARMES"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // --- Widgets de Componentes ---

//   Widget _buildStatusBarMock() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           _currentTime, 
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//             fontSize: 14,
//           ),
//         ),
//         const Row(
//           children: [
//             Icon(Icons.signal_cellular_4_bar, color: Colors.white, size: 18),
//             SizedBox(width: 5),
//             Icon(Icons.battery_full, color: Colors.white, size: 18),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildHeader() {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Align(
//           alignment: Alignment.centerLeft,
//           child: TextButton(
//             onPressed: () {}, 
//             child: Text(
//               "< voltar",
//               style: TextStyle(color: accentColor.withOpacity(0.8), fontSize: 14),
//             ),
//           ),
//         ),
//         Text(
//           "Morpheus",
//           style: TextStyle(
//             color: accentColor,
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildWeatherInfo() {
//     return Column(
//       children: [
//         Text(
//           _city, 
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 5),

//         Text(
//           "$_currentTemp°", 
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 90,
//             fontWeight: FontWeight.w300, 
//             height: 1.0, 
//           ),
//         ),
//         const SizedBox(height: 10),

//         Text(
//           _condition, 
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 5),

//         Text(
//           "Máx.: $_maxTemp° Mín.: $_minTemp°", 
//           style: TextStyle(
//             color: Colors.white.withOpacity(0.7),
//             fontSize: 14,
//           ),
//         ),
//         const SizedBox(height: 25),

//         Text(
//           _dateTime, 
//           style: TextStyle(
//             color: accentColor,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildButton(String text) {
//     return Container(
//       width: double.infinity,
//       height: 70, 
//       decoration: BoxDecoration(
//         color: const Color(0xFF0D0917), 
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.4),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: () {
//             // Ação do botão
//             print('Botão $text pressionado');
//           },
//           borderRadius: BorderRadius.circular(15),
//           child: Center(
//             child: Text(
//               text,
//               style: TextStyle(
//                 color: accentColor,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';
// import 'dart:async';

// class MorpheusHomePage extends StatefulWidget {
//   const MorpheusHomePage({super.key});

//   @override
//   State<MorpheusHomePage> createState() => _MorpheusHomePageState();
// }

// class _MorpheusHomePageState extends State<MorpheusHomePage> {
//   static const String API_KEY = 'f12a64ba4d5a0b79a68eb06c23fa8826';
//   static const String CITY_API = 'Cachoeirinha,br';

//   String _city = "Carregando...";
//   int _currentTemp = 0;
//   String _condition = "Aguardando dados...";
//   int _maxTemp = 0;
//   int _minTemp = 0;
//   String _dateTime = "Carregando...";
//   String _currentTime = "00:00";
//   bool _isLoading = true;

//   final Color accentColor = const Color(0xFFFFA726);

//   @override
//   void initState() {
//     super.initState();
//     Intl.defaultLocale = 'pt_BR';
//     _fetchWeatherData();
//     _updateTime();
//     Timer.periodic(const Duration(minutes: 1), (Timer t) => _updateTime());
//   }

//   Future<void> _fetchWeatherData() async {
//     setState(() => _isLoading = true);
//     final Uri uri = Uri.parse(
//       'https://api.openweathermap.org/data/2.5/weather?q=$CITY_API&appid=$API_KEY&units=metric&lang=pt',
//     );

//     try {
//       final response = await http.get(uri);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           _city = data['name'] ?? "Local Desconhecido";
//           _currentTemp = data['main']['temp'].round();
//           _maxTemp = data['main']['temp_max'].round();
//           _minTemp = data['main']['temp_min'].round();
//           String rawCondition = data['weather'][0]['description'] ?? 'Desconhecido';
//           _condition = rawCondition[0].toUpperCase() + rawCondition.substring(1);
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _city = "Erro ${response.statusCode}";
//           _condition = "Falha ao carregar clima";
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _city = "Erro de Conexão";
//         _condition = "Verifique a internet";
//         _isLoading = false;
//       });
//     }
//   }

//   void _updateTime() {
//     final now = DateTime.now();
//     final dateFormat = DateFormat('EEEE', 'pt_BR');
//     final formattedDate = dateFormat.format(now);
//     final timeFormat = DateFormat('hh:mm a', 'en_US');
//     final formattedTime = timeFormat.format(now);
//     final statusBarTimeFormat = DateFormat('HH:mm');
//     final formattedStatusBarTime = statusBarTimeFormat.format(now);

//     setState(() {
//       _dateTime = "${formattedDate[0].toUpperCase()}${formattedDate.substring(1)}, $formattedTime";
//       _currentTime = formattedStatusBarTime;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF0B1338),
//               Color(0xFF3B2737),
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 _buildStatusBar(),
//                 const SizedBox(height: 8),
//                 _buildHeader(context),
//                 const SizedBox(height: 30),
//                 _isLoading
//                     ? const Center(
//                         child: CircularProgressIndicator(color: Color(0xFFFFA726)),
//                       )
//                     : _buildWeatherSection(),
//                 const SizedBox(height: 40),
//                 _buildActionButton("Relatório Noturno"),
//                 const SizedBox(height: 20),
//                 _buildActionButton("Relatório semanal"),
//                 const SizedBox(height: 20),
//                 _buildActionButton("Alarmes"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildStatusBar() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           _currentTime,
//           style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
//         ),
//         const Row(
//           children: [
//             Icon(Icons.wifi, color: Colors.white, size: 18),
//             SizedBox(width: 4),
//             Icon(Icons.battery_full, color: Colors.white, size: 18),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Align(
//           alignment: Alignment.centerLeft,
//           child: TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text(
//               "< voltar",
//               style: TextStyle(color: accentColor.withOpacity(0.9), fontSize: 14),
//             ),
//           ),
//         ),
//         Text(
//           "Morpheus",
//           style: TextStyle(
//             color: accentColor,
//             fontWeight: FontWeight.w900,
//             fontSize: 26,
//             letterSpacing: 1,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildWeatherSection() {
//     return Column(
//       children: [
//         Text(
//           _city,
//           style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           "$_currentTemp°",
//           style: const TextStyle(color: Colors.white, fontSize: 95, fontWeight: FontWeight.w300),
//         ),
//         const SizedBox(height: 5),
//         Text(
//           _condition,
//           style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           "Máx.: $_maxTemp°  Mín.: $_minTemp°",
//           style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
//         ),
//         const SizedBox(height: 20),
//         Text(
//           _dateTime,
//           style: TextStyle(color: accentColor, fontSize: 18, fontWeight: FontWeight.w700),
//         ),
//       ],
//     );
//   }

//   Widget _buildActionButton(String text) {
//     return SizedBox(
//       width: double.infinity,
//       height: 65,
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.black,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//           elevation: 8,
//           shadowColor: Colors.black54,
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             color: accentColor,
//             fontSize: 18,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';
// import 'dart:async';

// class MorpheusHomePage extends StatefulWidget {
//   const MorpheusHomePage({super.key});

//   @override
//   State<MorpheusHomePage> createState() => _MorpheusHomePageState();
// }

// class _MorpheusHomePageState extends State<MorpheusHomePage> {
//   static const String API_KEY = 'f12a64ba4d5a0b79a68eb06c23fa8826';
//   static const String CITY_API = 'Cachoeirinha,br';

//   String _city = "Carregando...";
//   int _currentTemp = 0;
//   String _condition = "Aguardando dados...";
//   int _maxTemp = 0;
//   int _minTemp = 0;
//   String _dateTime = "Carregando...";
//   String _currentTime = "00:00";
//   bool _isLoading = true;

//   final Color accentColor = const Color(0xFFFFA726);

//   @override
//   void initState() {
//     super.initState();
//     Intl.defaultLocale = 'pt_BR';
//     _fetchWeatherData();
//     _updateTime();
//     Timer.periodic(const Duration(minutes: 1), (Timer t) => _updateTime());
//   }

//   Future<void> _fetchWeatherData() async {
//     setState(() => _isLoading = true);
//     final Uri uri = Uri.parse(
//       'https://api.openweathermap.org/data/2.5/weather?q=$CITY_API&appid=$API_KEY&units=metric&lang=pt',
//     );

//     try {
//       final response = await http.get(uri);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           _city = data['name'] ?? "Local Desconhecido";
//           _currentTemp = data['main']['temp'].round();
//           _maxTemp = data['main']['temp_max'].round();
//           _minTemp = data['main']['temp_min'].round();
//           String rawCondition = data['weather'][0]['description'] ?? 'Desconhecido';
//           _condition = rawCondition[0].toUpperCase() + rawCondition.substring(1);
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _city = "Erro ${response.statusCode}";
//           _condition = "Falha ao carregar clima";
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _city = "Erro de Conexão";
//         _condition = "Verifique a internet";
//         _isLoading = false;
//       });
//     }
//   }

//   void _updateTime() {
//     final now = DateTime.now();
//     final dateFormat = DateFormat('EEEE', 'pt_BR');
//     final formattedDate = dateFormat.format(now);
//     final timeFormat = DateFormat('hh:mm a', 'en_US');
//     final formattedTime = timeFormat.format(now);
//     final statusBarTimeFormat = DateFormat('HH:mm');
//     final formattedStatusBarTime = statusBarTimeFormat.format(now);

//     setState(() {
//       _dateTime = "${formattedDate[0].toUpperCase()}${formattedDate.substring(1)}, $formattedTime";
//       _currentTime = formattedStatusBarTime;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF0B1338),
//               Color(0xFF3B2737),
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 _buildStatusBar(),
//                 const SizedBox(height: 8),
//                 _buildHeader(),
//                 const SizedBox(height: 30),
//                 _isLoading
//                     ? const Center(
//                         child: CircularProgressIndicator(color: Color(0xFFFFA726)),
//                       )
//                     : _buildWeatherSection(),
//                 const SizedBox(height: 40),
//                 _buildActionButton("Relatório Noturno"),
//                 const SizedBox(height: 20),
//                 _buildActionButton("Relatório semanal"),
//                 const SizedBox(height: 20),
//                 _buildActionButton("Alarmes"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildStatusBar() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           _currentTime,
//           style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
//         ),
//         const Row(
//           children: [
//             Icon(Icons.wifi, color: Colors.white, size: 18),
//             SizedBox(width: 4),
//             Icon(Icons.battery_full, color: Colors.white, size: 18),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildHeader() {
//     return Center(
//       child: Text(
//         "Morpheus",
//         style: TextStyle(
//           color: accentColor,
//           fontWeight: FontWeight.w900,
//           fontSize: 26,
//           letterSpacing: 1,
//         ),
//       ),
//     );
//   }

//   Widget _buildWeatherSection() {
//     return Column(
//       children: [
//         Text(
//           _city,
//           style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           "$_currentTemp°",
//           style: const TextStyle(color: Colors.white, fontSize: 95, fontWeight: FontWeight.w300),
//         ),
//         const SizedBox(height: 5),
//         Text(
//           _condition,
//           style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
//         ),
//         const SizedBox(height: 4),
//         Text(
//           "Máx.: $_maxTemp°  Mín.: $_minTemp°",
//           style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
//         ),
//         const SizedBox(height: 20),
//         Text(
//           _dateTime,
//           style: TextStyle(color: accentColor, fontSize: 18, fontWeight: FontWeight.w700),
//         ),
//       ],
//     );
//   }

//   Widget _buildActionButton(String text) {
//     return SizedBox(
//       width: double.infinity,
//       height: 65,
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.black,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//           elevation: 8,
//           shadowColor: Colors.black54,
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             color: accentColor,
//             fontSize: 18,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:async';

// Importações das telas de destino. Certifique-se de que estes nomes de arquivo estão corretos.
import 'relatorio_noturno_page.dart'; 
import 'relatorio_semanal_page.dart';
import 'meus_alarmes_page.dart'; 

class MorpheusHomePage extends StatefulWidget {
  const MorpheusHomePage({super.key});

  @override
  State<MorpheusHomePage> createState() => _MorpheusHomePageState();
}

class _MorpheusHomePageState extends State<MorpheusHomePage> {
  static const String API_KEY = 'f12a64ba4d5a0b79a68eb06c23fa8826';
  static const String CITY_API = 'Cachoeirinha,br';

  String _city = "Carregando...";
  int _currentTemp = 0;
  String _condition = "Aguardando dados...";
  int _maxTemp = 0;
  int _minTemp = 0;
  String _dateTime = "Carregando...";
  String _currentTime = "00:00";
  bool _isLoading = true;

  final Color accentColor = const Color(0xFFFFA726);

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';
    _fetchWeatherData();
    _updateTime();
    Timer.periodic(const Duration(minutes: 1), (Timer t) => _updateTime());
  }

  Future<void> _fetchWeatherData() async {
    setState(() => _isLoading = true);
    final Uri uri = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$CITY_API&appid=$API_KEY&units=metric&lang=pt',
    );

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _city = data['name'] ?? "Local Desconhecido";
          _currentTemp = data['main']['temp'].round();
          _maxTemp = data['main']['temp_max'].round();
          _minTemp = data['main']['temp_min'].round();
          String rawCondition = data['weather'][0]['description'] ?? 'Desconhecido';
          _condition = rawCondition[0].toUpperCase() + rawCondition.substring(1);
          _isLoading = false;
        });
      } else {
        setState(() {
          _city = "Erro ${response.statusCode}";
          _condition = "Falha ao carregar clima";
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _city = "Erro de Conexão";
        _condition = "Verifique a internet";
        _isLoading = false;
      });
    }
  }

  void _updateTime() {
    final now = DateTime.now();
    final dateFormat = DateFormat('EEEE', 'pt_BR');
    final formattedDate = dateFormat.format(now);
    final timeFormat = DateFormat('hh:mm a', 'en_US');
    final formattedTime = timeFormat.format(now);
    final statusBarTimeFormat = DateFormat('HH:mm');
    final formattedStatusBarTime = statusBarTimeFormat.format(now);

    setState(() {
      _dateTime = "${formattedDate[0].toUpperCase()}${formattedDate.substring(1)}, $formattedTime";
      _currentTime = formattedStatusBarTime;
    });
  }

  // --- FUNÇÃO DE NAVEGAÇÃO ---
  void _navigateToScreen(String buttonText) {
    Widget? targetScreen;

    switch (buttonText) {
      case "Relatório Noturno":
        targetScreen = RelatorioNoturnoPage(); // Removido o 'const'
        break;
      case "Relatório semanal":
        targetScreen = RelatorioSemanalPage(); // Removido o 'const'
        break;
      case "Alarmes":
        targetScreen = MeusAlarmesPage(); // Removido o 'const'
        break;
      default:
        return;
    }

    // Se a tela for definida (ou seja, se for um dos três botões), navega.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => targetScreen!),
    );
    }
  // --- FIM FUNÇÃO DE NAVEGAÇÃO ---


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0B1338),
              Color(0xFF3B2737),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildStatusBar(),
                const SizedBox(height: 8),
                _buildHeader(),
                const SizedBox(height: 30),
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(color: Color(0xFFFFA726)),
                      )
                    : _buildWeatherSection(),
                const SizedBox(height: 40),
                _buildActionButton("Relatório Noturno"),
                const SizedBox(height: 20),
                _buildActionButton("Relatório semanal"),
                const SizedBox(height: 20),
                _buildActionButton("Alarmes"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _currentTime,
          style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const Row(
          children: [
            Icon(Icons.wifi, color: Colors.white, size: 18),
            SizedBox(width: 4),
            Icon(Icons.battery_full, color: Colors.white, size: 18),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Text(
        "Morpheus",
        style: TextStyle(
          color: accentColor,
          fontWeight: FontWeight.w900,
          fontSize: 26,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildWeatherSection() {
    return Column(
      children: [
        Text(
          _city,
          style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Text(
          "$_currentTemp°",
          style: const TextStyle(color: Colors.white, fontSize: 95, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 5),
        Text(
          _condition,
          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 4),
        Text(
          "Máx.: $_maxTemp°  Mín.: $_minTemp°",
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
        ),
        const SizedBox(height: 20),
        Text(
          _dateTime,
          style: TextStyle(color: accentColor, fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _buildActionButton(String text) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: ElevatedButton(
        // --- CORREÇÃO AQUI: CHAMANDO A FUNÇÃO DE NAVEGAÇÃO ---
        onPressed: () {
          _navigateToScreen(text);
        },
        // --- FIM DA CORREÇÃO ---
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          elevation: 8,
          shadowColor: Colors.black54,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: accentColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}