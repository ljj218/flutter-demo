/*
 * @Author: Long_jj
 * @Date: 2021-08-05 21:32:17
 * @LastEditTime: 2021-08-05 22:03:19
 * @LastEditors: Long_jj
 * @Description: 
 * @FilePath: /flutter_application_1/lib/pages/flexBox/FlexBox.dart
 */
import 'package:flutter/material.dart';

class FlexBoxPage extends StatelessWidget {
  const FlexBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('可伸缩盒子'),
        ),
        body: ListView(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 50,
                maxHeight: 100,
              ),
              child: Container(
                height: 5,
                child: DecoratedBox(
                  child: Text('contrainedBox'),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
                '可以看到，我们虽然将 Container 的高度设置为 5 像素，但是最终却是 50 像素，这正是 ConstrainedBox 的最小高度限制生效了。如果将 Container 的高度设置为 80 像素，那么最终红色区域的高度也会是 80 像素，因为在此示例中，ConstrainedBox 只限制了最小高度，并未限制最大高度。'),
            Text('通过上面示例，我们发现有多个constrainedBox嵌套时，对于minWidth和minHeight来说，是取父子中相应数值较大的。实际上，只有这样才能保证父限制与子限制不冲突。'),
            SizedBox(height: 10),
          ],
        ));
  }
}
