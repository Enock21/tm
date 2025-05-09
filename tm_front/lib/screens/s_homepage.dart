import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/providers/p_registration_data.dart';
import 'package:tm_front/utils/u_dialogs.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/utils/u_theme.dart';

class SHomepage extends StatefulWidget {
  const SHomepage({Key? key}) : super(key: key);

  @override
  _SHomepageState createState() => _SHomepageState();
}

class _SHomepageState extends State<SHomepage> {
  String _selectedItem = 'home'; // Item inicialmente selecionado

  Future<void> _handleLogout(BuildContext context) async {
    bool confirmed = await confirmOperation(
      context: context,
      title: 'Logout',
      content: 'Deseja realmente sair?',
      cancelText: 'Cancelar',
      confirmText: 'Confirmar',
    );
    if (confirmed) {
      Navigator.pushNamedAndRemoveUntil(
          context, URoutes.sLogin, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = 300.0;
    double buttonHeight = 45;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.boxColor,
        elevation: 0,
        leading: _buildIconButton(
          icon: Icons.home,
          label: 'home',
          onPressed: () {
            setState(() {
              _selectedItem = 'home';
            });
            // Navegar para a página inicial ou executar outra ação
          },
        ),
        actions: [
          _buildIconButton(
            icon: Icons.logout,
            label: 'logout',
            onPressed: () => _handleLogout(context),
            color: AppColors.negativeColor,
          ),
          // Adicione outros ícones aqui conforme necessário
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 390),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: TMButton.positive(
                  text: 'Meu Perfil de Usuário',
                  onPressed: () {
                    Navigator.pushNamed(context, URoutes.sUserProfile);
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: TMButton.positive(
                  text: 'Meu Perfil de Jogador',
                  onPressed: () {
                    Navigator.pushNamed(context, URoutes.sPlayerProfile);
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: TMButton.positive(
                  text: 'Meu Perfil de Mestre',
                  onPressed: () {
                    Navigator.pushNamed(context, URoutes.sGMProfile);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    Color? color,
  }) {
    final isSelected = _selectedItem == label;
    final circleColor = label == 'logout'
        ? (isSelected ? Colors.grey : Colors.transparent)
        : (isSelected ? Colors.purple : Colors.transparent);

    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circleColor,
      ),
      child: IconButton(
        icon: Icon(icon),
        color: color ?? AppColors.positiveColor,
        onPressed: onPressed,
      ),
    );
  }
}
