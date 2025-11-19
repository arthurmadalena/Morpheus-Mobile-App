import 'package:flutter/material.dart';

class NovoAlarmePage extends StatefulWidget {
  const NovoAlarmePage({super.key});

  @override
  State<NovoAlarmePage> createState() => _NovoAlarmePageState();
}

class _NovoAlarmePageState extends State<NovoAlarmePage> {
  TimeOfDay selectedTime = const TimeOfDay(hour: 7, minute: 0);

  List<String> diasSemana = [
    "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"
  ];

  List<bool> diasSelecionados = List.generate(7, (_) => false);

  DateTime? selectedDate;

  Future<void> escolherHorario() async {
    final TimeOfDay? pick = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pick != null) {
      setState(() => selectedTime = pick);
    }
  }

  Future<void> escolherData() async {
    DateTime hoje = DateTime.now();
    final DateTime? pick = await showDatePicker(
      context: context,
      initialDate: hoje,
      firstDate: hoje,
      lastDate: DateTime(2050),
    );

    if (pick != null) {
      setState(() => selectedDate = pick);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0824),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Novo Alarme"),
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // -------------------------------
            //  Escolher horário
            // -------------------------------
            const Text(
              "Horário",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),

            GestureDetector(
              onTap: escolherHorario,
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "${selectedTime.format(context)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // -------------------------------
            //   Dias da semana
            // -------------------------------
            const Text(
              "Repetir",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              children: List.generate(7, (index) {
                bool ativo = diasSelecionados[index];
                return ChoiceChip(
                  label: Text(
                    diasSemana[index],
                    style: TextStyle(
                      color: ativo ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: ativo,
                  selectedColor: Colors.amber,
                  backgroundColor: Colors.white12,
                  onSelected: (value) {
                    setState(() => diasSelecionados[index] = value);
                  },
                );
              }),
            ),

            const SizedBox(height: 25),

            // -------------------------------
            //   Data específica
            // -------------------------------
            const Text(
              "Data específica (opcional)",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),

            GestureDetector(
              onTap: escolherData,
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_month, color: Colors.amber),
                    const SizedBox(width: 10),
                    Text(
                      selectedDate == null
                          ? "Selecione uma data"
                          : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                      style: const TextStyle(color: Colors.white70, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),

            const Spacer(),

            // -------------------------------
            // Botão salvar alarme
            // -------------------------------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);

                  // Aqui você pode salvar o alarme no storage/local DB
                },
                child: const Text(
                  "SALVAR ALARME",
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
