import 'package:flutter/material.dart';

class Role extends StatelessWidget {
  const Role({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text("Hai Andi Lukito!"),
              SizedBox(height: 20),
              Text("Baru Daftar Yaa? Kamu Sebagai Apa?"),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                
                children: [
                  Image.asset(
                    'assets/undraw_sculpt.png',
                    width: 100,
                    height: 100,
                  ),
                  TextButton(

                    style: TextButton.styleFrom(
                      fixedSize: Size(150, 50),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                    ),
                    child: Text("Pelaku Usaha"),
                    onPressed: () {},
                  ),
                ],
              ),
              ),
              SizedBox(height: 20),
               Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                
                children: [
                  Image.asset(
                    'assets/688.jpg',
                    width: 100,
                    height: 100,
                  ),
                  TextButton(

                    style: TextButton.styleFrom(
                      fixedSize: Size(150, 50),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                    ),
                    child: Text("Investor"),
                    onPressed: () {},
                  ),
                ],
              ),
              ),
              SizedBox(height: 20),
              Text(
                "MUARA akan membantu mempertemukan pelaku usaha, pelanggan, dan juga investor dalam satu aplikasi!",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextButton(

                    style: TextButton.styleFrom(
                      fixedSize: Size(150, 50),
                      backgroundColor: Colors.purpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),)
                      ),
                    ),
                    child: Text("Pilih Sekarang", style: TextStyle(color: Colors.white),),
                    onPressed: () {},
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
