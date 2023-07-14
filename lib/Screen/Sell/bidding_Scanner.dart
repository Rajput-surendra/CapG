import 'dart:convert';

import 'package:eshop_multivendor/Helper/Constant.dart';
import 'package:eshop_multivendor/Helper/String.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Helper/Color.dart';
import '../../Models2/Bidding_model.dart';
import '../../widgets/appBar.dart';
import '../Language/languageSettings.dart';
import 'package:http/http.dart'as http;

import 'BiddingProduct.dart';

class BiddingProduct extends StatefulWidget {
  const BiddingProduct({Key? key}) : super(key: key);

  @override
  State<BiddingProduct> createState() => _BiddingProductState();
}

class _BiddingProductState extends State<BiddingProduct> {
  @override
  setStateNow() {
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductApi();
  }

  BiddingModel? biddingModel;
  getProductApi() async {
    var headers = {
      'Cookie': 'ci_session=6de428ca5f22ca5b6b89e41bfb4dc5184696b960; ekart_security_cookie=d56f1753070aa5a64f488d217693c18c'
    };
    var request = http.MultipartRequest('GET', Uri.parse('$baseUrl/bid_product'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = BiddingModel.fromJson(json.decode(result));
      setState(() {
        biddingModel = finalResult;
      });
      print('____finalResult______${finalResult}_________');
    }
    else {
    print(response.reasonPhrase);
    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
          appBar: getSimpleAppBar(getTranslated(context, 'BIDDING_PRODUCT')!, context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              biddingModel?.data == null ? Center(child: CircularProgressIndicator()) : biddingModel!.data!.length == 0 ? Text("No Product found"):Container(
                  height: MediaQuery.of(context).size.height/1,
                  child: ListView.builder(
                    itemCount: biddingModel?.data?.length,
                      itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BiddingProductConfirm(price: biddingModel!.data![index].price,productId: biddingModel!.data![index].productId,sellerId: biddingModel!.data![index].sellerId,)));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                         child: Column(
                           children: [
                             Row(
                               children: [
                                 Container(
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10)
                                   ),
                                   height: 100,
                                   width: 100,
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.circular(10),
                                       child:
                                       // Image.asset("assets/images/img_1.png",fit: BoxFit.fill ,)
                                       Image.network("${imageUrl}${biddingModel?.data?[index].logo}"),
                                     ),
                                   ),
                                 ),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("${biddingModel?.data?[index].name}",style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold),),
                                     Text("₹ ${biddingModel?.data?[index].price}")
                                   ],
                                 )
                               ],
                             )
                           ],
                         ),
                      ),
                    );
                  }),
                )
            ],
          ),
        ),
      ),
    );
  }
}
