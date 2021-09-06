import 'package:flutter/material.dart';

class CityDropDownBar extends StatefulWidget {
  @override
  _CityDropDownBarState createState() => _CityDropDownBarState();
}


class _CityDropDownBarState extends State<CityDropDownBar> {   
  
    final  List<String> _locations = ['Australia','Canada', 'New Zealand'];
      List<String> _curstate =[];
     String? selectedLocation;
     String? selecetedstate;
    final  List<String> _ausstate = ['NSW', 'ACT', 'WA', 'NT', 'SA', 'QLD', 'VIC', 'TAS'];   
    final  List<String> _canadastate = ['Alberta', 'British Columbia', 'Manitoba', 'New Brunswick', 'Newfoundland and Labrador', 'Northwest Territories', 'Nova Scotia', 'Nunavut', 'Ontario', 'Prince Edward Island', 'Quebec', 'Saskatchewan', 'Yukon'];  
    final  List<String> _nzstate = ['Northland', 'Auckland', 'Waikato', 'Bay of Plenty', 'Gisborne', 'Hawke\'s Bay', 'Taranaki', 'Manawatu-Whanhanui', 'Wellington', 'Tasman', 'Nelson', 'Marlborough', 'West Coast', 'Canterbury', 'Otago', 'Southland'];
  @override
  Widget build(BuildContext context) {
        return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
          child: Column(
          children: [
            SizedBox(
                  height: 20,
                ),
              Center(
                child: Title(
                  color: Color(0xff076800),
                  child: Text(
                    'Select Country and',
                    
                    style: TextStyle(
                        color: Color(0xff076800),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                
              ),
              Center(
                child: Title(
                  color: Color(0xff076800),
                  child: Text(
                    'State/Territory',
                    
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
            Container(                            
                  margin:const EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                            border: Border.all(width: 0.5)                                                    
                  ),
                  child: DropdownButton<String>(
                    
                    hint: Text('   Please choose a Country'), 
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 31,// Not necessary for Option 1
                    isExpanded: true,                
                    underline: SizedBox(height: 20,),
                    value:selectedLocation,         
                onChanged: (newValue) {
                  setState(() {
                    selecetedstate = null;
                    selectedLocation = newValue;
                    if(newValue == 'Australia'){
                      // setState(() {
                        _curstate =_ausstate;
                        print(_curstate);
                        print("??????????????????????????????");
                      // });
                    }else if(newValue == 'Canada'){
                      // setState(() {
                        _curstate =_canadastate;//_canadasate
                      // });
                    }else if(newValue == 'New Zealand'){
                      // setState(() {
                        _curstate =_nzstate;//_canadasate
                      // });
                    }
                  });
                },
                items: _locations.map((location) {
                  return DropdownMenuItem(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: new Text(location),
                    ),
                    value: location,
                  );
                }).toList(),
              ),          
    ),

    SizedBox( height: 20,),
    Container(           
      margin:const EdgeInsets.only(left: 30, right: 30),
                                   
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5)                                                    
                  ),
                  child: DropdownButton<String>(
                    hint: Text('   Please choose a State'), 
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 31,// Not necessary for Option 1
                    isExpanded: true,                
                    underline: SizedBox(height: 20,),
                    value:selecetedstate,         
                onChanged: (newValue) {
                  setState(() {
                    selecetedstate = newValue;
                  });
                },
                items: _curstate.map((location) {
                  return DropdownMenuItem(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: new Text(location),
                    ),
                    value: location,
                  );
                }).toList(),
              ),          
    ),

                  SizedBox(
                height: 30,
              ),
              //ImagePickerForCategory(),
            MaterialButton(
              onPressed: () {},
              child: Text('Sign Up'),
              textColor: Color(0xffFFFFFF),
              color: Color(0xff076800),
              minWidth: MediaQuery.of(context).size.width * 0.50,
              height: MediaQuery.of(context).size.height * 0.05,
              
            ),               
                 ],
          ),
      ),
        );
  }
}