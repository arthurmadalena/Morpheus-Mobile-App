import 'package:flutter/material.dart';
import 'novo_alarme_page.dart'; // <-- importe a nova tela

class MeusAlarmesPage extends StatefulWidget {
  const MeusAlarmesPage({super.key});

  @override
  State<MeusAlarmesPage> createState() => _MeusAlarmesPageState();
}

class _MeusAlarmesPageState extends State<MeusAlarmesPage> {
  final List<Map<String, dynamic>> alarmesMock = [
    {"hora": "08:40 AM", "desc": "Todos os dias", "ativo": true},
    {"hora": "05:20 AM", "desc": "Somente às quartas-feiras", "ativo": true},
    {"hora": "10:00 AM", "desc": "Desativado", "ativo": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0D0A2C),
      appBar: AppBar(
        title: const Text("Meus Alarmes"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Alarmes Salvos",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // ---------------------------
            // LISTA DE ALARMES
            // ---------------------------
            ...alarmesMock.map((a) {
              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          a["hora"],
                          style: const TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          a["desc"],
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    Icon(
                      a["ativo"]
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: Colors.amberAccent,
                      size: 28,
                    )
                  ],
                ),
              );
            }),

            const Spacer(),

            // ---------------------------
            // BOTÃO ATUALIZADO
            // ---------------------------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NovoAlarmePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // preto
                  foregroundColor: Colors.amber, // texto laranja
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  "ADICIONAR ALARME",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}