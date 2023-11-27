import 'package:flutter/cupertino.dart';
import 'package:sdirbinsen/dashboard/component/custom_appbar.dart';
import 'package:sdirbinsen/dashboard/component/custom_body.dart';

import '../responsive.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(),
            SizedBox(
              height: 16.0,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CustomBody(),
                          SizedBox(
                            height: 16.0,
                          ),
                          if (Responsive.isMobile(context))
                            SizedBox(
                              height: 16.0,
                            ),
                          // if (Responsive.isMobile(context)) Discussions(),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(
                        width: 16.0,
                      ),
                    // if (!Responsive.isMobile(context))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            children: [
                              if(!Responsive.isMobile(context))
                              // Expanded(
                              //   child: TopReferals(),
                              //   flex: 2,
                              // ),
                                if(!Responsive.isMobile(context))
                                  SizedBox(width: 16.0,),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          if (Responsive.isMobile(context))
                            SizedBox(
                              height: 16.0,
                            ),
                          // if (Responsive.isMobile(context)) TopReferals(),
                          if (Responsive.isMobile(context))
                            SizedBox(
                              height: 16.0,
                            ),
                          // if (Responsive.isMobile(context)) UsersByDevice(),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(
                        width: 16.0,
                      ),
                    // if (!Responsive.isMobile(context))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
