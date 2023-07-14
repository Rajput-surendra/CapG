import 'dart:convert';

import 'package:eshop_multivendor/Helper/Constant.dart';
import 'package:eshop_multivendor/Screen/Sell/shoos_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../../Helper/Color.dart';
import '../../Models2/Get_sub_model.dart';
import '../../widgets/appBar.dart';
import '../Language/languageSettings.dart';

class ModelScreen extends StatefulWidget {
 ModelScreen({Key? key,this.catID}) : super(key: key);
  String? catID;

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSubCatApi();
  }
  GetSubModel? getSubModel;
  getSubCatApi() async {
    var headers = {
      'Cookie': 'ci_session=dff198e1be2c178b137c620053b701a4d243d24a; ekart_security_cookie=55f826ca73b59ac7f1138d3fcac56523'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/subcategory_get'));
    request.fields.addAll({
      'category_id': widget.catID.toString()
    });
    print('____request.fields______${request.fields}_________');
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult =GetSubModel.fromJson(jsonDecode(result));
      setState(() {
        getSubModel =  finalResult;
      });
    }
    else {
    print(response.reasonPhrase);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.whiteTemp,
        // appBar: getSimpleAppBar(getTranslated(context, 'MODEL')!, context),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: colors.red,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios_new,size: 20,)),
                        SizedBox(width: 5,),
                        Text("SELECT MODEL",style: TextStyle(color: colors.blackTemp,fontSize: 13),),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Image.asset("assets/images/model.png",height: 50,),
                  ),
                  Divider(
                    color: colors.black54.withOpacity(0.2),
                    thickness: 1,
                  ),
                ],
              ),
            ),
            getSubModel?.data == null ? Center(child: CircularProgressIndicator()) : getSubModel!.data!.length == 0 ? Text("No Model found!!"):
            Container(
              height: MediaQuery.of(context).size.height/1.3,
              child: ListView.builder(
                itemCount: getSubModel!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoosDetailsScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network("${imageUrl}${getSubModel!.data![index].image}",fit: BoxFit.fill,height: MediaQuery.of(context).size.height/7,)),
                          ),
                          SizedBox(width: 10,),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Center(child: Text("${getSubModel!.data![index].name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: colors.blackTemp),)),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
