import 'package:daily_caters/view/Signup/Country.dart';
import 'package:daily_caters/view/Signup/image_picker_Signup.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({ Key? key }) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

    // final  List<String> _locations = ['Canada','Ausralia'];
    //   List<String> _curstate =[];
    //   String? selectedLocation='';
    //   String? selecetedstate='';
    // final  List<String> _ausstate = ['NSW', 'ACT', 'VIC', 'NT','WA', 'TASMANIA'];   
    // final  List<String> _canadastate = ['Ah', 'Bo', 'Ban'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
          child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Column(
            children: [
              SizedBox(
                  height: 20,
                ),
              Center(
                child: Title(
                  color: Color(0xff076800),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Color(0xff076800),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                  height: 30,
              ),
              
              Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                          hintText: 'Enter a User Name'),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                      
                      border: OutlineInputBorder(),
                      labelText: 'Email ID',
                      hintText: 'Enter your Email ID'),
                ),
              ),
                
              
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your New Password'),
                      
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      
                      border: OutlineInputBorder(),
                      labelText: 'Re-type Password',
                      hintText: 'Re-type your New Password'),
                ),
              ),
              
              // Container(
              //  // width: MediaQuery.of(context).size.width * 0.7,
              //   //margin: EdgeInsets.only(left: 10, right: 10),
              //   child: CityDropDownBar()),  
              SizedBox(
                height: 30,
              ),
              ImagePickerForCategory(),
            MaterialButton(
              onPressed: () {},
              child: Text('Next'),
              textColor: Color(0xffFFFFFF),
              color: Color(0xff076800),
              minWidth: MediaQuery.of(context).size.width * 0.50,
              height: MediaQuery.of(context).size.height * 0.05,
              
            ),
          ],
          ),
          ),
          ),
        );
  }
}

// class SignupPage extends StatelessWidget {
// //  const SignupPage({Key? key}) : super(key: key);
  
// 		final  List<String> _locations = ['Canada','Aus'];
// 		  List<String> _curstate =[];
// 		final  List<String> _ausstate = ['Ahmedabad', 'Bombay', 'Bangalore', 'surat','delhi'];   
// 		final  List<String> _canadastate = ['Ahmedabad', 'Bombay', 'Bangalore', 'surat','delhi'];  

//   @override
//   Widget build(BuildContext context) {
//     return  
//     SingleChildScrollView(
//       child: Container(
//           child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             children: [
//               SizedBox(
//                   height: 20,
//                 ),
//               Center(
//                 child: Title(
//                   color: Color(0xff076800),
//                   child: Text(
//                     'Sign Up',
//                     style: TextStyle(
//                         color: Color(0xff076800),
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                   height: 30,
//               ),
//               Padding(
//                     padding: EdgeInsets.all(10),
//                     child: TextField(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'User Name',
//                           hintText: 'Enter a User Name'),
//                     ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Email ID',
//                       hintText: 'Enter your Email ID'),
//                 ),
//               ),
                
              
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Password',
//                       hintText: 'Enter your New Password'),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Re-type Password',
//                       hintText: 'Re-type your New Password'),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: DropdownButton<String>(
                  
//                     hint: Text('Please choose a location'), 
//                     icon: Icon(Icons.arrow_drop_down),
//                     iconSize: 31,// Not necessary for Option 1
//                     isExpanded: true,                
//                     underline: SizedBox(height: 20,),
//                     value:selectedLocation.isNotEmpty ? selectedLocation : null,         
//                 onChanged: (newValue) {
//                   setState(() {
//                     selectedLocation = newValue;
//                     if(newValue == 'Aus'){
//                       setState(() {
//                         _curstate =_ausstate;
//                       });
//                     }else if(newValue == 'canada'){
//                       setState(() {
//                         _curstate =_canadastate;//_canadasate
//                       });
//                     }
//                   });
//                 },
//                 items: _locations.map((location) {
//                   return DropdownMenuItem(
//                     child: new Text(location),
//                     value: location,
//                   );
//                 }).toList(),
                  
//                 )
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: DropdownButton<String>(
//                     hint: Text('Please choose a location'), 
//                     icon: Icon(Icons.arrow_drop_down),
//                     iconSize: 31,// Not necessary for Option 1
//                     isExpanded: true,                
//                     underline: SizedBox(height: 20,),
//                     value:selectedLocation.isNotEmpty ? selectedLocation : null,         
//                 onChanged: (newValue) {
//                   setState(() {
//                     selectedLocation = newValue;
//                   });
//                 },
                
//                 items: _curstate.map((location) {
//                   return DropdownMenuItem(
//                     child: new Text(location),
//                     value: location,
//                   );
//                 }).toList(),
//               ),
//             ],
//           )
//         ),
//       ),
//     );
//   }
// }
