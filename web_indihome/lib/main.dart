import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(IndiHomeFullClone());

class IndiHomeFullClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IndiHome - Aktivitas Tanpa Batas',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        primaryColor: const Color(0xFFEE2E24),
      ),
      home: MainHomePage(),
    );
  }
}

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final Color indihomeRed = const Color(0xFFEE2E24);
  final Color secondaryGrey = const Color(0xFFF4F4F4);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(isMobile),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(screenWidth),
            _buildBenefitsSection(),
            _buildPackageSection(),
            _buildPromoBanner(),
            _buildFAQSection(),
            _buildFooter(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => launchUrl(Uri.parse("https://wa.me/628123456789")),
        backgroundColor: Colors.green,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  // 1. NAVBAR
  PreferredSizeWidget _buildAppBar(bool isMobile) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      toolbarHeight: 80,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 50),
        child: Row(
          children: [
            Text("IndiHome", 
              style: GoogleFonts.montserrat(color: indihomeRed, fontWeight: FontWeight.w900, fontSize: 26)),
            if (!isMobile) ...[
              const Spacer(),
              _navItem("Produk"),
              _navItem("Promo"),
              _navItem("Bantuan"),
              const SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: indihomeRed,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15)
                ),
                child: const Text("Langganan Baru", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              )
            ]
          ],
        ),
      ),
    );
  }

  Widget _navItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(text, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 15)),
    );
  }

  // 2. HERO SECTION
  Widget _buildHeroSection(double width) {
    return Container(
      width: double.infinity,
      height: 550,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [indihomeRed, const Color(0xFFB31217)]),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -50, bottom: -50,
            child: Icon(Icons.wifi, size: 400, color: Colors.white.withOpacity(0.1)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Semua Rumah, Semua Bisa", 
                  style: GoogleFonts.montserrat(color: Colors.white, fontSize: 48, fontWeight: FontWeight.w800)),
                const SizedBox(height: 10),
                const Text("Internet stabil dengan teknologi fiber optik tercanggih", 
                  style: TextStyle(color: Colors.white, fontSize: 20)),
                const SizedBox(height: 40),
                // SEARCH BOX AREA
                Container(
                  width: width > 700 ? 600 : width * 0.9,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      const Icon(Icons.location_on, color: Colors.grey),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: "Masukkan lokasi pasang...", border: InputBorder.none),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: indihomeRed,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)
                        ),
                        child: const Text("Cek Area", style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 3. BENEFITS
  Widget _buildBenefitsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Wrap(
        spacing: 50, runSpacing: 30, alignment: WrapAlignment.center,
        children: [
          _benefitItem(Icons.speed, "Kecepatan Tinggi", "Hingga 300 Mbps"),
          _benefitItem(Icons.tv, "Hiburan Lengkap", "100+ Channel TV"),
          _benefitItem(Icons.security, "Koneksi Stabil", "Teknologi Fiber Optik"),
          _benefitItem(Icons.headset_mic, "Dukungan 24/7", "Layanan Pelanggan"),
        ],
      ),
    );
  }

  Widget _benefitItem(IconData icon, String title, String desc) {
    return Column(
      children: [
        CircleAvatar(radius: 35, backgroundColor: secondaryGrey, child: Icon(icon, color: indihomeRed, size: 30)),
        const SizedBox(height: 15),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(desc, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  // 4. PACKAGES
  Widget _buildPackageSection() {
    return Container(
      color: secondaryGrey,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          const Text("Pilih Paket Terbaikmu", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          Wrap(
            spacing: 25, runSpacing: 25,
            children: [
              _packageCard("JITU 1P", "50 Mbps", "230.000", "Internet Only"),
              _packageCard("JITU 2P", "100 Mbps", "375.000", "Internet + TV"),
              _packageCard("GAMER", "200 Mbps", "550.000", "Low Latency Gaming"),
            ],
          )
        ],
      ),
    );
  }

  Widget _packageCard(String title, String speed, String price, String sub) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15)]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: indihomeRed.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Text(title, style: TextStyle(color: indihomeRed, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 20),
          Text(speed, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          Text(sub, style: const TextStyle(color: Colors.grey)),
          const Divider(height: 40),
          const Text("Benefit:", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _featureRow("Bebas FUP"),
          _featureRow("Instalasi Cepat"),
          _featureRow("Free Cloud Storage"),
          const SizedBox(height: 30),
          Text("Rp $price", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: indihomeRed)),
          const Text("/ bulan", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: indihomeRed, padding: const EdgeInsets.all(20)),
              child: const Text("Pilih Paket", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  Widget _featureRow(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(children: [const Icon(Icons.check, color: Colors.green, size: 16), const SizedBox(width: 8), Text(text)]),
    );
  }

  // 5. PROMO
  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.all(50),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: NetworkImage("https://images.unsplash.com/photo-1544197150-b99a580bb7a8?auto=format&fit=crop&w=1350&q=80"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
        )
      ),
      child: const Column(
        children: [
          Text("PROMO TERBARU", style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("Diskon Biaya Pasang 70%", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
          Text("Daftar hari ini dan nikmati penghematan besar!", style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  // 6. FAQ
  Widget _buildFAQSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          const Text("Sering Ditanyakan", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                _faqItem("Apa itu IndiHome?", "Layanan digital terdepan menggunakan infrastruktur fiber optik..."),
                _faqItem("Berapa lama pemasangan?", "Biasanya memakan waktu 1-3 hari kerja setelah verifikasi."),
                _faqItem("Apakah ada kontrak?", "Kontrak berlangganan minimal adalah 12 bulan."),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _faqItem(String q, String a) {
    return ExpansionTile(title: Text(q, style: const TextStyle(fontWeight: FontWeight.bold)), children: [Padding(padding: const EdgeInsets.all(16), child: Text(a))]);
  }

  // 7. FOOTER
  Widget _buildFooter() {
    return Container(
      color: const Color(0xFF1A1A1A),
      padding: const EdgeInsets.all(80),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text("IndiHome", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text("Bagian dari Telkom Indonesia", style: TextStyle(color: Colors.grey)),
              ]),
              const Column(children: [
                Text("Tentang Kami", style: TextStyle(color: Colors.white)),
                Text("Syarat & Ketentuan", style: TextStyle(color: Colors.white)),
                Text("Pusat Bantuan", style: TextStyle(color: Colors.white)),
              ]),
            ],
          ),
          const Divider(color: Colors.white12, height: 60),
          const Text("© 2024 IndiHome Telkomsel. All Rights Reserved.", style: TextStyle(color: Colors.white38)),
        ],
      ),
    );
  }
}