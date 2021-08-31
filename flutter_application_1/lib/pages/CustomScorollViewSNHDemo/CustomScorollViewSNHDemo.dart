/*
 * @Author: Long_jj
 * @Date: 2021-08-26 22:02:53
 * @LastEditTime: 2021-08-30 16:05:22
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\CustomScorollViewSNHDemo\CustomScorollViewSNHDemo.dart
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
// https://h5.48.cn/resource/jsonp/allmembers.php?gid=00&callback=get_members_success&_=1629985910907

class CustomScorollViewSNHDemo extends StatefulWidget {
  const CustomScorollViewSNHDemo({Key? key}) : super(key: key);

  @override
  _CustomScorollViewSNHDemoState createState() =>
      _CustomScorollViewSNHDemoState();
}

class _CustomScorollViewSNHDemoState extends State<CustomScorollViewSNHDemo> {
  List<Member> _members = [];

  @override
  void initState() {
    _getHttpGridData();
    super.initState();
  }

  _getHttpGridData() async {
    var url = Uri.parse(
        'https://h5.48.cn/resource/jsonp/allmembers.php?gid=00&callback=get_members_success&_=1629985910907');
    try {
      var res = await http.get(url);
      // print(res.statusCode);
      if (res.statusCode != 200) throw ('err');
      String hadSting = res.body.substring(20, res.body.length - 2);
      final json = jsonDecode(hadSting)['rows'];
      // print(json.length);
      // json['rows']
      for (var i = 0; i < json.length; i++) {
        setState(() {
          _members.add(Member(
            id: json[i]['sid'],
            name: json[i]['sname'],
            tname: json[i]['tname'],
            nickname: json[i]['nickname'],
            pname: json[i]['pname'],
            joinday: json[i]['join_day'],
            height: json[i]['height'],
            birthday: json[i]['birth_day'],
            starsign12: json[i]['star_sign_12'],
            tcolor: json[i]['tcolor'],
            birthplace: json[i]['birth_place'],
            speciality: json[i]['speciality'],
            hobby: json[i]['hobby'],
          ));
        });
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              title: Text('SHN'),
            ),
            SliverToBoxAdapter(),
            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(
                  'SII', 'https://www.snh48.com/images/ot/mem_s_bt.jpg'),
              pinned: true,
            ),
            _buildTeamList('SII'),
            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(
                  'NII', 'https://www.snh48.com/images/ot/mem_n_bt.jpg'),
              pinned: true,
            ),
            _buildTeamList('NII'),
            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(
                  'HII', 'https://www.snh48.com/images/ot/mem_h_bt.jpg'),
              pinned: true,
            ),
            _buildTeamList('HII'),
            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(
                  'X', 'https://www.snh48.com/images/ot/mem_x_bt.jpg'),
              pinned: true,
            ),
            _buildTeamList('X'),
            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(
                  'J', 'https://www.snh48.com/images/ot/mem_j_bt.jpg'),
              pinned: true,
            ),
            _buildTeamList('J'),
            SliverPersistentHeader(
              delegate: MySliverPersistentHeaderDelegate(
                  '荣誉毕业生', 'https://www.snh48.com/images/ot/mem_bys_bt.jpg'),
              pinned: true,
            ),
            _buildTeamList('荣誉毕业生'),
          ],
        ),
        onRefresh: () async {
          _getHttpGridData();
        },
      ),
    );
  }

  SliverGrid _buildTeamList(String teamName) {
    List<Member> team =
        _members.where((item) => item.tname == teamName).toList();
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PlayerInfo(team[index])));
          },
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: team[index].log,
                  child: CircleAvatar(
                    radius: 30,
                    foregroundImage: NetworkImage(
                        'https://www.snh48.com/images/temp/vote8/zx8_def_s.png'),
                    backgroundImage: NetworkImage(team[index].log),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  team[index].name,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        );
      }, childCount: team.length),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  String title;
  String url;
  MySliverPersistentHeaderDelegate(this.title, this.url);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
            color: Colors.grey[300]!,
          ))),
      height: 40,
      child: Image.network(
        '$url',
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate.title != title;
  }
}

class Member {
  late String name;
  late String id;
  late String tname;
  late String nickname;
  late String pname;
  late String joinday;
  late String height;
  late String birthday;
  late String starsign12;
  late String tcolor;
  late String birthplace;
  late String speciality;
  late String hobby;

  Member({
    required this.name,
    required this.id,
    required this.tname,
    required this.nickname,
    required this.pname,
    required this.joinday,
    required this.height,
    required this.birthday,
    required this.starsign12,
    required this.tcolor,
    required this.birthplace,
    required this.speciality,
    required this.hobby,
  });

  String get log {
    return "https://www.snh48.com/images/member/zp_$id.jpg";
  }
}

class PlayerInfo extends StatefulWidget {
  final Member info;

  PlayerInfo(this.info, {Key? key});

  @override
  _PlayerInfoState createState() => _PlayerInfoState();
}

class _PlayerInfoState extends State<PlayerInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final info = widget.info;
    final color = '0xff${info.tcolor}';
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: BackButton(
              color: Colors.grey,
            ),
            expandedHeight: 200,
            backgroundColor: Color(int.parse(color)),
            pinned: true, //顶住顶部
            // floating: true, //浮在上面
            stretch: true, //配合 stretchModes
            flexibleSpace: FlexibleSpaceBar(
              title: Text('${info.name}'),
              background: Hero(
                tag: info.log,
                child: Image.network(
                  '${info.log}',
                  fit: BoxFit.cover,
                ),
              ),
              stretchModes: [
                // StretchMode.blurBackground,
                StretchMode.fadeTitle,
                StretchMode.zoomBackground,
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildUsreInfo('昵称', info.nickname),
              _buildUsreInfo('加入所属', info.pname),
              _buildUsreInfo('生日', info.birthday),
              _buildUsreInfo('星座', info.starsign12),
              _buildUsreInfo('身高', info.height),
              _buildUsreInfo('特长', info.speciality),
              _buildUsreInfo('爱好', info.hobby),
            ]),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              color: Colors.blue[300],
              child: Text('队服照'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Image.network(
                  'https://www.snh48.com/images/member/gs4_${widget.info.id}_1.jpg'),
              Image.network(
                  'https://www.snh48.com/images/member/gs4_${widget.info.id}_2.jpg'),
              Image.network(
                  'https://www.snh48.com/images/member/gs4_${widget.info.id}_3.jpg'),
              Image.network(
                  'https://www.snh48.com/images/member/gs4_${widget.info.id}_4.jpg'),
            ]),
          ),
        ],
      ),
    );
  }

  _buildUsreInfo(key, val) {
    final index = Random().nextInt(18);
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.primaries[index][100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$key'),
          Expanded(
            child: Text(
              '$val',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
              // maxLines: 1,
              // overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
