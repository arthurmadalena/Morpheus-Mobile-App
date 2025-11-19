import 'package:flutter/material.dart';

// ===========================================
// 1. WIDGET PARA DESENHAR A LINHA DE QUALIDADE
// ===========================================

class WeeklyLinePainter extends CustomPainter {
  final List<double> qualityData;
  final double maxVisualHeight;

  WeeklyLinePainter(this.qualityData, this.maxVisualHeight);

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.lightGreenAccent
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = Colors.lightGreenAccent
      ..style = PaintingStyle.fill;

    final path = Path();
    double xStep = size.width / (qualityData.length - 1);

    double getY(double quality) {
      return maxVisualHeight - ((quality / 100.0) * maxVisualHeight);
    }

    path.moveTo(0, getY(qualityData[0]));

    for (int i = 1; i < qualityData.length; i++) {
      double x = i * xStep;
      double y = getY(qualityData[i]);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, linePaint);

    for (int i = 0; i < qualityData.length; i++) {
      canvas.drawCircle(
          Offset(i * xStep, getY(qualityData[i])), 3.0, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant WeeklyLinePainter oldDelegate) => true;
}

// ===========================================
// 2. WIDGET PARA DESENHAR AS BARRAS
// ===========================================

class WeeklyBarItemWidget extends StatelessWidget {
  final double value; 
  final String label;
  final double maxBarHeight = 120.0;
  final double maxHourValue = 12.0;

  const WeeklyBarItemWidget({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final double barHeight = (value / maxHourValue) * maxBarHeight;
    final bool isWeekend = label == 'Sáb' || label == 'Dom';
    final Color barColor = isWeekend ? Colors.amber : const Color(0xFF3B5998);

    return Column(
      children: [
        Container(
          height: maxBarHeight,
          alignment: Alignment.bottomCenter,
          child: Container(
            height: barHeight,
            width: 18,
            decoration: BoxDecoration(
              color: barColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 10)),
      ],
    );
  }
}

// ===========================================
// 3. TELA PRINCIPAL COM EXPANSÕES
// ===========================================

class RelatorioSemanalPage extends StatelessWidget {
  const RelatorioSemanalPage({super.key});

  final List<double> horasDormidas = const [6, 5, 7, 8, 5, 9, 7];
  final List<double> qualidadeSono = const [70, 65, 80, 85, 60, 95, 88];
  final List<String> daysLabels = const ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"];
  final double chartVisualHeight = 120.0;

  @override
  Widget build(BuildContext context) {

    // Estatísticas automáticas
    double melhorNoite = horasDormidas.reduce((a, b) => a > b ? a : b);
    double piorNoite = horasDormidas.reduce((a, b) => a < b ? a : b);

    double mediaHoras = horasDormidas.reduce((a, b) => a + b) / horasDormidas.length;
    double meta = 8.0; // pode ser variável

    return Scaffold(
      backgroundColor: const Color(0xff0D0A2C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Relatório Semanal"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("Sono",
                style: TextStyle(fontSize: 26, color: Colors.white)),
            const SizedBox(height: 15),

            // =====================================================
            // RESUMO SUPERIOR
            // =====================================================
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("7h 23m",
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                      const Text("Sono médio",
                          style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text("82",
                          style: TextStyle(fontSize: 35, color: Colors.white)),
                      Text("Qualidade do sono",
                          style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // =====================================================
            // CARDS DE ESTATÍSTICAS
            // =====================================================
            Row(
              children: [
                Expanded(
                  child: _infoCard(
                    titulo: "Melhor noite",
                    valor: "${melhorNoite.toStringAsFixed(1)}h",
                    icone: Icons.check_circle,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _infoCard(
                    titulo: "Pior noite",
                    valor: "${piorNoite.toStringAsFixed(1)}h",
                    icone: Icons.warning_amber_rounded,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // =====================================================
            // META DE SONO
            // =====================================================
            Text("Meta de Sono (8h)",
                style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 5),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: mediaHoras / meta,
                minHeight: 10,
                backgroundColor: Colors.white12,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreenAccent),
              ),
            ),

            const SizedBox(height: 25),

            // =====================================================
            // GRÁFICO PRINCIPAL
            // =====================================================
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    bottom: 25,
                    top: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('12h',
                            style: TextStyle(color: Colors.white54, fontSize: 10)),
                        Text('8h',
                            style: TextStyle(color: Colors.white54, fontSize: 10)),
                        Text('4h',
                            style: TextStyle(color: Colors.white54, fontSize: 10)),
                        Text('0h',
                            style: TextStyle(color: Colors.white54, fontSize: 10)),
                      ],
                    ),
                  ),

                  Positioned(
                    right: 0,
                    bottom: 25,
                    top: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('100',
                            style: TextStyle(color: Colors.white54, fontSize: 10)),
                        Text('80',
                            style: TextStyle(color: Colors.white54, fontSize: 10)),
                        Text('60',
                            style: TextStyle(color: Colors.white54, fontSize: 10)),
                        Text('0',
                            style: TextStyle(color: Colors.white54, fontSize: 10)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: SizedBox(
                      height: chartVisualHeight,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: CustomPaint(
                              painter: WeeklyLinePainter(
                                  qualidadeSono, chartVisualHeight),
                            ),
                          ),
                          Positioned.fill(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                for (int i = 0; i < horasDormidas.length; i++)
                                  WeeklyBarItemWidget(
                                    value: horasDormidas[i],
                                    label: daysLabels[i],
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),
            const Text(
              "Dormiu melhor no fim de semana.",
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 25),

            // =====================================================
            // ALERTA DINÂMICO
            // =====================================================
            _alertBox(
              texto:
                  "Sua média de horas dormidas está ${meta - mediaHoras >= 0 ? "abaixo" : "acima"} da meta.",
            ),

            const SizedBox(height: 25),

            // =====================================================
            // RECOMENDAÇÕES INTELIGENTES
            // =====================================================
            const Text(
              "Recomendações",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(height: 10),

            _recommendation("Tente manter horários consistentes de dormir."),
            _recommendation("Evite telas brilhantes 1h antes de deitar."),
            _recommendation("Você tende a dormir melhor aos sábados; tente replicar sua rotina daquele dia."),
          ],
        ),
      ),
    );
  }

  // ============================================
  // ELEMENTOS EXTRAS (CARDS, ALERTA, RECO)
  // ============================================

  Widget _infoCard({
    required String titulo,
    required String valor,
    required IconData icone,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icone, color: Colors.lightGreenAccent, size: 28),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: const TextStyle(color: Colors.white70)),
              Text(valor,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget _alertBox({required String texto}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.info, color: Colors.orange),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              texto,
              style: const TextStyle(color: Colors.orange, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }

  Widget _recommendation(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          const Icon(Icons.north_east, color: Colors.lightGreenAccent, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70),
            ),
          )
        ],
      ),
    );
  }
}