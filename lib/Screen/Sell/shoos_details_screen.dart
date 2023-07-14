import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Helper/Color.dart';
import '../../widgets/appBar.dart';
import '../Language/languageSettings.dart';

class ShoosDetailsScreen extends StatefulWidget {
  const ShoosDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ShoosDetailsScreen> createState() => _ShoosDetailsScreenState();
}

class _ShoosDetailsScreenState extends State<ShoosDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.whiteTemp,

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
                        Text("SELECT A CHECK",style: TextStyle(color: colors.blackTemp,fontSize: 13),),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Image.asset("assets/images/details.png",height: 50,),
                  ),
                  Divider(
                    color: colors.black54.withOpacity(0.2),
                    thickness: 1,
                  ),
                ],
              ),
            ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    children: [
                      Text("Nike"),
                      SizedBox(height: 8,),
                      Text("Nike Dunk"),

                    ],
                  ),
                    Image.asset("assets/images/nikerighrt.png",height: 50,)
                  ],
                ),
              ),
              Text("UPLOAD PRODUCT IMAGE" ,style: TextStyle(color: colors.blackTemp,fontWeight: FontWeight.bold),),
            Divider(
              color: colors.black54.withOpacity(0.2),
              thickness: 1,
            ),
               uploadImages(),
          ],
        ),
      ),
    );
  }

  File? image;
  File? nl;
  File? so;
  File? it;
  File? ab;
  File? od;
  File? di;

  Future galery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    print('$imageTemporary');
    setState(() {
      this.image = imageTemporary;
    });
  }

  Future In() async {
    final nl = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (nl == null) return;
    final imageTemporary = File(nl.path);
    print('$imageTemporary');
    setState(() {
      this.nl = imageTemporary;
    });
  }

  Future ns() async {
    final nl = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (nl == null) return;
    final imageTemporary = File(nl.path);
    print('$imageTemporary');
    setState(() {
      this.so = imageTemporary;
    });
  }

  Future st() async {
    final nl = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (nl == null) return;
    final imageTemporary = File(nl.path);
    print('$imageTemporary');
    setState(() {
      this.it = imageTemporary;
    });
  }

  Future bl() async {
    final nl = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (nl == null) return;
    final imageTemporary = File(nl.path);
    print('$imageTemporary');
    setState(() {
      this.ab = imageTemporary;
    });
  }

  Future dc() async {
    final nl = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (nl == null) return;
    final imageTemporary = File(nl.path);
    print('$imageTemporary');
    setState(() {
      this.od = imageTemporary;
    });
  }

  Future ad() async {
    final nl = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (nl == null) return;
    final imageTemporary = File(nl.path);
    print('$imageTemporary');
    setState(() {
      this.di = imageTemporary;
    });


  }
  Widget uploadImages(){
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3.2,
                height: MediaQuery.of(context).size.height / 7,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.grey.shade100,
                  child: Stack(children: [
                    Opacity(
                        opacity: 1,
                        child: image != null
                            ? Stack(
                          children: [
                            Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),child: Image.file(
                                  image!,
                                  fit: BoxFit.fill,
                                ),
                                )),
                            Positioned(
                              top: 63,left: 0,
                              right: 0,
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        image = null;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ],
                        )
                            : Stack(
                          children: [
                            Center(
                                child: Image.asset('assets/images/appearance.png',scale: 2,)),
                            Positioned(
                              top: 63,left: 0,
                              right: 0,
                              child: Center(
                                child: IconButton(
                                    onPressed: () async {
                                      await galery();
                                    },
                                    icon: Icon(
                                        Icons.add_circle_outlined)),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            right: 2.0, top: 5, left: 5),
                        child: GestureDetector(
                          child: Container(
                              width: MediaQuery.of(context).size.width / 4.5,
                              height: MediaQuery.of(context).size.height / 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(child: Text("Appearance"))),
                        )
                      // ElevatedButton(onPressed: (){}, child: Text("Appearance")),
                    ),
                  ]),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3.2,
                height: MediaQuery.of(context).size.height / 7,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.grey.shade100,
                  child: Stack(children: [
                    Opacity(
                        opacity: 1,
                        child: nl != null
                            ? Stack(
                          children: [
                            Container(
                                height: double.infinity,
                                width: double.infinity,
                                child:
                                ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.file(nl!, fit: BoxFit.fill))),
                           Positioned(
                             top: 63,left: 0,
                             right: 0,
                             child:
                           Center(
                             child: IconButton(
                                 onPressed: () {
                                   setState(() {
                                     nl = null;
                                   });
                                 },
                                 icon: Icon(
                                   Icons.delete,
                                   color: Colors.black,
                                 )),
                           ),
                           )
                          ],
                        )
                            : Stack(
                          children: [
                            Center(
                                child: Image.asset('assets/images/inside-label.png',scale: 2,)),
                            Positioned(
                              top: 63,left: 0,
                              right: 0,
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      In();
                                    },
                                    icon: Icon(
                                        Icons.add_circle_outlined)),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            right: 2.0, top: 5, left: 5),
                        child: GestureDetector(
                          child: Container(
                              width: MediaQuery.of(context).size.width / 4.5,
                              height: MediaQuery.of(context).size.height / 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(child: Text("inside label"))),
                        )
                      // ElevatedButton(onPressed: (){}, child: Text("Appearance")),
                    ),
                  ]),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3.2,
                height: MediaQuery.of(context).size.height / 7,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.grey.shade100,
                  child: Stack(children: [
                    Opacity(
                        opacity: 1,
                        child: so != null
                            ? Stack(
                          children: [
                            Container(
                                width: double.infinity,
                                height: double.infinity,
                                child:
                                ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.file(so!, fit: BoxFit.fill))),
                            Positioned(
                              top: 63,left: 0,
                              right: 0,
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        so = null;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ],
                        )
                            : Stack(
                          children: [
                            Center(
                                child: Image.asset(

                                    'assets/images/insole.png',scale: 2,)),
                            Positioned(
                              top: 63,left: 0,
                              right: 0,
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      ns();
                                    },
                                    icon: Icon(
                                        Icons.add_circle_outlined)),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            right: 2.0, top: 5, left: 5),
                        child: GestureDetector(
                          child: Container(
                              width: MediaQuery.of(context).size.width / 7,
                              height: MediaQuery.of(context).size.height / 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(child: Text("insole"))),
                        )
                      // ElevatedButton(onPressed: (){}, child: Text("Appearance")),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3.2,
                height: MediaQuery.of(context).size.height / 7,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.grey.shade100,
                  child: Stack(children: [
                    Opacity(
                      opacity: 1,
                      child: Center(
                          child: it != null
                              ? Stack(
                            children: [
                              Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),child: Image.file(it!,
                                      fit: BoxFit.fill),
                                  )),
                              Positioned(
                                top: 63,left: 0,
                                right: 0,
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          it = null;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                            ],
                          )
                              : Stack(
                            children: [
                              Center(
                                  child: Image.asset(

                                      'assets/images/inside-label.png',scale: 2,)),
                              Positioned(
                                top: 63,left: 0,
                                right: 0,
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        st();
                                      },
                                      icon: Icon(Icons.add_circle)),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            right: 2.0, top: 5, left: 5),
                        child: GestureDetector(
                          child: Container(
                              width: MediaQuery.of(context).size.width / 4.5,
                              height: MediaQuery.of(context).size.height / 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(child: Text("insole stitc.."))),
                        )
                      // ElevatedButton(onPressed: (){}, child: Text("Appearance")),
                    ),
                  ]),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3.2,
                height: MediaQuery.of(context).size.height / 7,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.grey.shade100,
                  child: Stack(children: [
                    Opacity(
                      opacity: 1,
                      child: Center(
                          child: ab != null
                              ? Stack(
                            children: [
                              Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: ClipRRect(borderRadius:BorderRadius.circular(20) ,
                                    child: Image.file(ab!,
                                        fit: BoxFit.fill),
                                  )),
                              Positioned(
                                top: 63,left: 0,
                                right: 0,
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          ab = null;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                            ],
                          )
                              : Stack(
                            children: [
                              Center(
                                  child: Image.asset(

                                      'assets/images/box-label.png', scale: 2,)),
                              Positioned(
                                top: 63,left: 0,
                                right: 0,
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        bl();
                                      },
                                      icon: Icon(
                                        Icons.add_circle_outlined,
                                      )),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            right: 2.0, top: 5, left: 5),
                        child: GestureDetector(
                          child: Container(
                              width: MediaQuery.of(context).size.width / 4.5,
                              height: MediaQuery.of(context).size.height / 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(child: Text("Box label"))),
                        )
                      // ElevatedButton(onPressed: (){}, child: Text("Appearance")),
                    ),
                  ]),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3.2,
                height: MediaQuery.of(context).size.height / 7,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.grey.shade100,
                  child: Stack(children: [
                    Opacity(
                      opacity: 1,
                      child: Center(
                          child: od != null
                              ? Stack(
                            children: [
                              Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      child: Image.file(od!,
                                          fit: BoxFit.fill))),
                              Positioned(
                                top: 63,left: 0,
                                right: 0,
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          od = null;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                            ],
                          )
                              : Stack(
                            children: [
                              Center(
                                  child: Image.asset(

                                      'assets/images/date-code.png', scale: 2,)),
                              Positioned(
                                top: 63,left: 0,
                                right: 0,
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        dc();
                                      },
                                      icon: Icon(
                                          Icons.add_circle_outlined)),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            right: 2.0, top: 5, left: 5),
                        child: GestureDetector(
                          child: Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.height / 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(child: Text("Data code"))),
                        )
                      // ElevatedButton(onPressed: (){}, child: Text("Appearance")),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7.0, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3.2,
                height: MediaQuery.of(context).size.height / 7,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.grey.shade100,
                  child: Stack(children: [
                    Opacity(
                      opacity: 1,
                      child: Center(
                          child: di != null
                              ? Stack(
                            children: [
                              Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      child: Image.file(di!,
                                          fit: BoxFit.fill))),
                              Positioned(
                                top: 63,left: 0,
                                right: 0,
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          di = null;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                            ],
                          )
                              : Stack(
                            children: [
                              Center(
                                  child: Image.asset(

                                      'assets/images/additional.png',   scale: 2,)),
                                  Positioned(
                                    top: 63,left: 0,
                                    right: 0,
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        ad();
                                      },
                                      icon: Icon(
                                          Icons.add_circle_outlined)),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            right: 2.0, top: 5, left: 5),
                        child: GestureDetector(
                          child: Container(
                              width: MediaQuery.of(context).size.width / 4.5,
                              height: MediaQuery.of(context).size.height / 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(child: Text("Additonal"))),
                        )
                      // ElevatedButton(onPressed: (){}, child: Text("Appearance")),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
