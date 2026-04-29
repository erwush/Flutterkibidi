import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  int _getCrossAxisCount(double width) {
    if (width < 360) return 2;
    if (width < 600) return 3;
    return 4;
  }

  double _getIconSize(double width) {
    if (width < 360) return 26;
    if (width < 600) return 32;
    return 38;
  }

  double _getFontSize(double width) {
    if (width < 360) return 11;
    if (width < 600) return 12;
    return 14;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Beranda',
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final crossAxisCount = _getCrossAxisCount(width);
          final iconSize = _getIconSize(width);
          final fontSize = _getFontSize(width);

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // ===== HEADER CARD =====
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A4D8C),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'LaPak Bantul',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Pusat layanan pajak terpadu',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.account_balance, color: Colors.blue),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ===== RESPONSIVE GRID =====
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1,
                    ),
                    itemCount: _menus.length,
                    itemBuilder: (context, index) {
                      final item = _menus[index];
                      return _MenuItem(
                        icon: item.icon,
                        label: item.label,
                        iconSize: iconSize,
                        fontSize: fontSize,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ===== DATA MENU =====
final List<_MenuData> _menus = [
  _MenuData(Icons.receipt_long, 'PBB'),
  _MenuData(Icons.description, 'BPHTB'),
  _MenuData(Icons.list_alt, 'Rekap'),
  _MenuData(Icons.support_agent, 'Layanan\nKeliling'),
  _MenuData(Icons.info_outline, 'Info'),
  _MenuData(Icons.grid_view, 'Lainnya'),
];

class _MenuData {
  final IconData icon;
  final String label;

  _MenuData(this.icon, this.label);
}

// ===== WIDGET MENU ITEM =====
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final double iconSize;
  final double fontSize;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.iconSize,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: iconSize, color: Colors.black87),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }
}
