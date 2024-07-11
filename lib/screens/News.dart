import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> with SingleTickerProviderStateMixin {

  List <Tab> _tabList = [
    Tab(child: Text('اخبار آمورشی', style: TextStyle(color: Colors.teal.shade100),),),
    Tab(child: Text('اخبار فرهنگی', style: TextStyle(color: Colors.teal.shade100),),),
    Tab(child: Text('رویداد ها', style: TextStyle(color: Colors.teal.shade100),),),
  ];

  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length , vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        actions: [
          IconButton(
          onPressed: () {},
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu, color: Colors.white,
            ),
          ),
        ),
        ],
        backgroundColor: Colors.teal.shade900,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'خبر ها',
            textAlign: TextAlign.right, // RTL alignment for the title text
            style: TextStyle(
              fontFamily: 'Baloo', // Setting Persian font using fontFamily
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            indicatorColor: Colors.white,
            isScrollable: true,
            labelColor: Colors.teal.shade100,
            controller: _tabController,
            tabs: _tabList,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 12,
          itemBuilder: (context, index) => CardItem(),),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Container(
          height: 400.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.teal.shade100,
          ),
          child: Column(
            children: <Widget> [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'lib/images/sbuimage.png',
                  ),
                ),
                title: Text('دانشگاه شهید بهشتی',
                  style: TextStyle(fontFamily: 'Baloo',
                  fontWeight: FontWeight.bold),
                ),
                subtitle: Text('سه شنبه 1 اردیبهشت 12:50:14',
                style: TextStyle(fontSize: 12),),
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/images/sbu.jpeg'),
                    fit: BoxFit.fill,
                  ),
                    borderRadius: BorderRadius.circular(10),
                ),
                ),
              ),
              ),
              Row(
                children: <Widget> [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(right: 13.0, left: 13.0, bottom: 16.0),
                    child: Text('معاونت دانشجویی در نظر دارد به منظور تسهیل تردد دانشجویان ساکن در شهر تهران نسبت به برقراری سرویس از میادین آزادی،انقلاب،امام حسین، شهد، خراسان و رسالت به دانشگاه و بالعکس اقدام نماید.'),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
