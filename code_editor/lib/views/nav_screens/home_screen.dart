import 'package:code_editor/utils/home_container.dart';
import 'package:code_editor/views/nav_screens/code_editor_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "CodeIt",
          style: GoogleFonts.montserrat(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 3
          ),
        ),
        leading: Image.asset("assets/images/codeit_logo.jpeg",height: 80,width: 80,fit: BoxFit.cover,),
      ),
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>CodeEditorScreen(
                            regex: 'input\s*\((["\'](.*?)["\']\s*)?\)',
                            defaultCode: 'print("Hello World")',
                            language: 'python',
                          )
                      )
                  );
                },
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: HomeContainer(title: "Python", image: "assets/images/python_logo.png"),
            )),
            GestureDetector(
                onTap: ()=>Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_)=>CodeEditorScreen(
                            regex: 'cin\s*>>\s*((?:\w+\s*>>\s*)*\w+)\s*',
                            defaultCode: "#include<iostream>\nusing namespace std;\nint main(){\n  cout<<\"Hello World\";\n  return 0;\n}",
                            language: 'cpp'
                        )
                    )
                ),
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: HomeContainer(
                  title: "C++",
                  image: "assets/images/cpp-logo.png"
              ),
            )),
            GestureDetector(
                onTap: ()=>Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_)=>CodeEditorScreen(
                            regex: '(\w+)\s+(\w+)\s*=\s*sc\.next(\w+)\s*\(\s*\)\s*',
                            defaultCode: "public class Main{\n  public static void main(String[]args){\n    System.out.println(\"Hello World\");\n }\n}",
                            language: 'java'
                        )
                    )
                ),
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: HomeContainer(
                  title: "Java",
                  image: "assets/images/java_logo.png"
              ),
                )
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "More Languages \nAre \nComing Soon!",
                style: GoogleFonts.montserrat(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 3
                ),
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      )
    );
  }
}
