import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({Key? key}) : super(key: key);

  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empresa"),
      ),
      body: Center(
        child: Column(children: const [
          ListTile(
            title: Text('Stellantis'),
            subtitle: Text(
                'Stellantis é uma montadora líder global e fornecedora de mobilidade que oferece soluções de mobilidade limpas, conectadas, acessíveis e seguras. A força de nossa empresa está na amplitude de nosso portfólio de marcas icônicas, na diversidade e paixão de nosso pessoal e em nossas raízes profundas nas comunidades em que operamos. Nossas ambiciosas estratégias de eletrificação e software e a criação de um ecossistema inovador de parcerias estratégicas e revolucionárias estão impulsionando nossa transformação em uma empresa de tecnologia de mobilidade sustentável.'),
          ),
          ListTile(
            title: Text('Veículo'),
            subtitle: Text(
                'O principal destaque do compacto Fiat 500e do grupo Stellantis é o motor elétrico com 87kW. O motor rende o equivalente a 118 cavalos de potência e pode chegar aos 100km/h em apenas 9 segundos, contando com uma autonomia de 320 quilômetros e diversos modos de dirigibilidade, podendo escolher entre um modelo mais econômico (com menos potência e mais economia) e um modelo sport (com mais potência porém menos econômico).'),
          ),
        ]),
      ),
    );
  }
}
