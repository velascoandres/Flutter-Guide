import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page vire'),
      ),
      body: Container(
        child: PageView.builder(
          itemBuilder: (context, index){
			  return Container(
				  color: index % 2 == 0 ? Colors.pink : Colors.tealAccent,
			  );
		  },
        ),
      ),
    );
  }
}
