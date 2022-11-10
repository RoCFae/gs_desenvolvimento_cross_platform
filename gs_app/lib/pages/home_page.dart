import 'package:flutter/material.dart';
import 'package:gs_app/pages/company.dart';
import 'package:gs_app/pages/extra_page.dart';
import 'package:gs_app/pages/eletroposto.dart';
import 'package:gs_app/pages/veiculo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setPaginaAtual,
        children: const [
          VeiculosListaPage(),
          CompanyPage(),
          Eletroposto(),
          ExtraPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.car_rental_outlined), label: 'Veiculos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business_sharp), label: 'Empresa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.electric_bolt_outlined), label: 'Eletroposto'),
          BottomNavigationBarItem(
              icon: Icon(Icons.extension_sharp), label: 'Extras'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
      ),
    );
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }
}
