import 'package:flutter/material.dart';

class rival_page extends StatefulWidget
{

  @override
  _rival_page createState() => _rival_page();
}

class _rival_page extends State<rival_page>
{
  int _selectedIndex = 0;
  List<Post> _posts = []; // 게시글을 저장할 리스트 추가

  late List<Widget> _widgetOptions; // WidgetOptions를 late로 변경


  void initState()
  {
    super.initState();
    // _widgetOptions를 생성자 내에서 초기화합니다.
    _widgetOptions = <Widget>[
      StampCompetitionPage(posts: _posts, deletePost: _deletePost), // 스탬프 경쟁 화면 추가 및 게시글 리스트, 삭제 함수 전달
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addPost(String title, String body, DateTime startDate, DateTime endDate, int maxParticipants, int stampCount) {
    setState(() {
      _posts.add(Post(title, body, startDate, endDate, maxParticipants, stampCount)); // 게시글 추가
    });
  }

  void _deletePost(int index) {
    setState(() {
      _posts.removeAt(index); // 게시글 삭제
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스탬프 경쟁'), // 네비게이션 바 예제 타이틀을 "스탬프 경쟁"으로 변경
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton
        (
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostPage(addPost: _addPost)), // 게시글 추가 함수 전달
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class StampCompetitionPage extends StatefulWidget {
  final List<Post> posts; // 게시글 리스트 받아오기
  final Function(int) deletePost; // 게시글 삭제 함수 받아오기

  StampCompetitionPage({required this.posts, required this.deletePost}); // 생성자 추가

  @override
  _StampCompetitionPageState createState() => _StampCompetitionPageState();
}

class _StampCompetitionPageState extends State<StampCompetitionPage> {
  late List<Post> _filteredPosts;

  @override
  void initState() {
    super.initState();
    _filteredPosts = widget.posts;
  }

  void _filterPosts(String keyword) {
    setState(() {
      _filteredPosts = widget.posts.where((post) =>
      post.title.toLowerCase().contains(keyword.toLowerCase()) ||
          post.body.toLowerCase().contains(keyword.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('스탬프 경쟁'), // 스탬프 경쟁 타이틀 없애기
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterPosts,
              decoration: InputDecoration(
                labelText: '검색',
                prefixIcon: Icon(Icons.search,color: Colors.black),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredPosts.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _filteredPosts[index].title, // 게시글 제목 표시
                        style: TextStyle(
                          fontSize: 18, // 원하는 폰트 크기로 조정
                          fontWeight: FontWeight.bold, // 원하는 폰트 두께로 조정
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '시작 날짜: ${_formatDate(_filteredPosts[index].startDate)}',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ), // 시작 날짜 표시
                          SizedBox(width: 10),
                          Text(
                            '종료 날짜: ${_formatDate(_filteredPosts[index].endDate)}',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ), // 종료 날짜 표시
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '최대 참가 인원: ${_filteredPosts[index].maxParticipants}',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ), // 최대 참가 인원 표시
                          SizedBox(width: 10),
                          Text(
                            '스탬프 개수: ${_filteredPosts[index].stampCount}',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ), // 스탬프 개수 표시
                        ],
                      ),
                    ],
                  ),

                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_filteredPosts[index].body}',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ), // 게시글 본문 표시
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // 참가 기능 실행
                          },
                          child: Text('참가'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            widget.deletePost(index); // 게시글 삭제 함수 호출
                          },
                          child: Text('삭제'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }
}

class PostPage extends StatefulWidget {
  final Function(String, String, DateTime, DateTime, int, int) addPost; // 게시글 추가 함수를 받아오기

  PostPage({required this.addPost}); // 생성자 추가

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  late DateTime _startDate;
  late DateTime _endDate;
  late int _maxParticipants;
  late int _stampCount;
  List<int> _participantsList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
    _endDate = DateTime.now();
    _maxParticipants = _participantsList[0];
    _stampCount = 1; // 기본 스탬프 개수 설정
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 작성'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: '제목',
              ),

            ),
            SizedBox(height: 20),
            Container(
              height: 300,
              color: Colors.black12,
              child: TextField(
                controller: _bodyController,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '본문',
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _selectDate(context, true);
                  },
                  child: Text('시작 날짜 선택'),
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    _selectDate(context, false);
                  },
                  child: Text('종료 날짜 선택'),
                ),
              ],
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<int>(
              value: _maxParticipants,
              onChanged: (value) {
                setState(() {
                  _maxParticipants = value!;
                });
              },
              items: _participantsList.map((value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: '최대 참가 인원',
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<int>(
              value: _stampCount,
              onChanged: (value) {
                setState(() {
                  _stampCount = value!;
                });
              },
              items: _participantsList.map((value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: '스탬프 개수',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(400, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                String title = _titleController.text;
                String body = _bodyController.text;
                if (title.isNotEmpty && body.isNotEmpty) {
                  widget.addPost(title, body, _startDate, _endDate, _maxParticipants, _stampCount); // 게시글 추가 함수 호출
                  Navigator.pop(context); // 화면 닫기
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('제목과 본문을 입력하세요.'),
                    ),
                  );
                }
              },
              child: Text('업로드'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }
}

class Post {
  final String title;
  final String body;
  final DateTime startDate;
  final DateTime endDate;
  final int maxParticipants;
  final int stampCount;

  Post(this.title, this.body, this.startDate, this.endDate, this.maxParticipants, this.stampCount);
}