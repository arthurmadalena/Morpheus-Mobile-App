import 'package:flutter/material.dart';

// Widget para simular uma única barra do gráfico
class BarItemWidget extends StatelessWidget {
  final double value; // Valor das Horas Dormidas (máximo 10)
  final double maxBarHeight = 120.0;
  final String label;

  const BarItemWidget({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    // Calcula a altura da barra como proporção da altura máxima
    final double barHeight = (value / 10.0) * maxBarHeight; 
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // A barra em si
        Container(
          height: maxBarHeight,
          alignment: Alignment.bottomCenter,
          child: Container(
            height: barHeight,
            width: 18,
            decoration: BoxDecoration(
              color: const Color(0xFF3B5998), // Cor azul escuro
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Rótulo do dia
        Text(
          label, 
          style: const TextStyle(color: Colors.white70, fontSize: 10)
        ),
      ],
    );
  }
}

// Widget para desenhar a linha de qualidade do sono usando CustomPaint
class LinePainter extends CustomPainter {
  final List<double> qualityData; // Dados de qualidade (0 a 100)
  final double maxBarHeight = 120.0; // Altura máxima para mapeamento

  LinePainter(this.qualityData);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.lightGreenAccent // Cor da linha de tendência
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    
    // O eixo X tem 6 intervalos para 7 pontos (0 a 6)
    double xStep = size.width / (qualityData.length - 1);

    // Converte o valor de qualidade (0-100) para uma coordenada Y (0-120)
    // Inverte o Y, pois 0 é o topo
    double getY(double quality) {
      // Mapeia 100 para 0 (topo) e 0 para maxBarHeight (base)
      return maxBarHeight - ((quality / 100.0) * maxBarHeight);
    }

    // Ponto inicial
    path.moveTo(0, getY(qualityData[0]));

    // Desenha a linha conectando os pontos
    for (int i = 1; i < qualityData.length; i++) {
      double x = i * xStep;
      double y = getY(qualityData[i]);

      // Simula uma curva simples (semelhante ao isCurved=true do fl_chart)
      // Pode ser ajustado para path.lineTo(x, y) se preferir linhas retas
      path.lineTo(x, y); 
    }
    
    canvas.drawPath(path, paint);

    // Desenhar pontos (opcional)
    final dotPaint = Paint()
      ..color = Colors.lightGreenAccent
      ..style = PaintingStyle.fill;

    for (int i = 0; i < qualityData.length; i++) {
      canvas.drawCircle(Offset(i * xStep, getY(qualityData[i])), 3.0, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant LinePainter oldDelegate) => true;
}


class RelatorioNoturnoPage extends StatelessWidget {
  const RelatorioNoturnoPage({super.key});

  final double horas = 8.25;
  final int qualidade = 92;

  final List<double> horasWeek = const [6, 5, 7, 8, 5, 9, 8];
  final List<double> qualityWeek = const [72, 65, 81, 88, 60, 95, 92];

  @override
  Widget build(BuildContext context) {
    const List<String> daysLabels = ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'];

    return Scaffold(
      backgroundColor: const Color(0xff0D0A2C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Relatório Noturno"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("🌞 Bom dia!", style: TextStyle(fontSize: 24, color: Colors.white)),
            const SizedBox(height: 12),
            const Text(
              "Seu corpo agradece pelo cuidado que você teve com o sono na última noite. Vamos dar uma olhada no seu relatório:",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            Text("🕒 Horas Dormidas: $horas h",
                style: const TextStyle(color: Colors.white, fontSize: 18)),
            Text("✨ Qualidade do Sono: $qualidade%",
                style: const TextStyle(color: Colors.white, fontSize: 18)),
            const Text("💪 Recuperação Física e Mental: Excelente",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 20),
            const Text(
              "📊 Relatório Semanal de Horas",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            const SizedBox(height: 20),
            
            // --- GRÁFICO ESTÁTICO PERSONALIZADO ---
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  // 1. Linha de Qualidade do Sono (Custom Painter)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0), // Ajuste horizontal
                    child: CustomPaint(
                      size: const Size(double.infinity, 120), // Altura do gráfico
                      painter: LinePainter(qualityWeek),
                    ),
                  ),

                  // 2. Gráfico de Barras (Horas Dormidas)
                  Positioned.fill(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        for (int i = 0; i < horasWeek.length; i++)
                          BarItemWidget(
                            value: horasWeek[i],
                            label: daysLabels[i],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // --- FIM DO GRÁFICO ---
            
            const SizedBox(height: 20),
            const Text(
              "Dica do Morpheus",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              "Você teve uma das melhores noites da semana! Sábado e domingo são seus dias de descanso ideal — que tal manter esse ritmo nos dias úteis com uma rotina de sono mais regular?",
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}