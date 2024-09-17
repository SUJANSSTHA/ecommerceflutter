import 'package:ecommerceflutter/widget/support_widget.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final List<String> Categoryitem = ['Watch', 'Laptop', 'TV', 'Headphone'];

// String? value;
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text("Add Product", style: AppWidget.seamiboldTextFeildStyle()),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload the Product Image",
                style: AppWidget.lightTextFeildStyle(),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.camera_alt_outlined),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Product Name",
                style: AppWidget.lightTextFeildStyle(),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFECECF8),
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Product Category",
                style: AppWidget.lightTextFeildStyle(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFECECF8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  value: selectedItem,
                  isExpanded: true,
                  underline: SizedBox(),
                  items: Categoryitem.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: AppWidget.seamiboldTextFeildStyle(),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? Value) {
                    setState(() {
                      selectedItem = Value;
                    });
                  },
                  // dropdownColor: Colors.black,
                  hint: Text("Select Category"),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Add Product",style: TextStyle(fontSize: 20.0),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
