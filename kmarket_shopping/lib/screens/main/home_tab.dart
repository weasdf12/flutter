import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kmarket_shopping/providers/auth_provider.dart';
import 'package:kmarket_shopping/screens/main/my_tab.dart';
import 'package:kmarket_shopping/screens/member/login_screen.dart';
import 'package:kmarket_shopping/services/token_storage_service.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget{

  final Function(int) onTabSwitch;

  const HomeTab({super.key, required this.onTabSwitch});

  @override
  State<StatefulWidget> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab>{

  final tokenStorageService = TokenStorageService();
  @override
  Widget build(BuildContext context) {return Scaffold(
      appBar: AppBar(title: _buildAppBar(context),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _BuildSearchBar(context),
            _buildSlideBenner(context),
            _bulidProductSection(context, 'top'),
            _bulidProductSection(context, 'hit'),
            _bulidProductSection(context, '추천'),
            _bulidProductSection(context, 'new'),
            _bulidProductSection(context, 'dis'),
            _buildFooter(context),
          ],
        ),
      )
    );
  }
  Widget _buildAppBar(BuildContext context){

    final authProvider = Provider.of<AuthProvider>(context);
    bool isLoggedIn = authProvider.isLoggedIn;
    
    log('$isLoggedIn');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('images/logo.png', width: 140,),
        IconButton(
            onPressed: () async {

              if(isLoggedIn){
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (_) => MyTab()),
                // );
                //마이페이지 탭 전환
                widget.onTabSwitch(3);
              }else {
                await Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => LoginScreen())
                );
                setState(() {});
              }
            },
            icon: Icon(
              isLoggedIn ? Icons.person : Icons.login, size: 30,
            ),
        ),
      ],
    );
  }
  Widget _BuildSearchBar(BuildContext context){
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: '상품검색',
          border:null,
        ),
      ),
    );
  }

  Widget _buildSlideBenner(BuildContext context){
    final List<String> bannerImages = [
      'images/slider_item1.jpg',
      'images/slider_item2.jpg',
      'images/slider_item3.jpg',
      'images/slider_item4.jpg',
      'images/slider_item5.jpg',
    ];

    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: bannerImages.length,
        itemBuilder: (context, index){
          final pathImage = bannerImages[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            child: Image.asset(pathImage),
          );
        }
      ),
    );
  }

  Widget _bulidProductSection(BuildContext context, String title){


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(title, style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index){
              return Container(
                width: 150,
                height: 150,
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      color: Colors.grey,
                      child: Image.asset('images/sample_thumb.jpg'),
                    ),
                    Text('T-shirts'),
                    Text('100')
                  ],
                ),
              );
            }
          ),
        )
      ],
    );
  }

  Widget _buildFooter(BuildContext context){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      color: Colors.grey[200],
      child: Column(
        children: [
          Text('aaaa'),
          Text('bbbb', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text('cccc', style: TextStyle(fontSize: 10),),
        ],
      ),
    );
  }

}