import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';

class SalaryWidget extends StatefulWidget {
  const SalaryWidget({super.key});

  @override
  State<SalaryWidget> createState() => _SalaryWidgetState();
}

class _SalaryWidgetState extends State<SalaryWidget> {
  var _selectedCurrency ;
TextEditingController currencyController =TextEditingController(text: '₹');
TextEditingController initialSalaryController = TextEditingController();
TextEditingController finalSalaryController = TextEditingController();
bool perk1Value = false;
bool perk2Value = false;
bool perk3Value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Salary & Perks',
          style: TextStyle(
              color: kfontColor, fontSize: 13, fontWeight: FontWeight.w600),
        ),
        Container(
           padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(border: Border.all(width: 0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('CTC',style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13
              ),),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: currencyController,
                      decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10),
                     suffixIcon: PopupMenuButton(
                      icon: const Icon(Icons.arrow_drop_down),
                      itemBuilder: (context) =>const[
                        PopupMenuItem(value: '₹',child: Text('₹'),),
                        PopupMenuItem(value: 'USD',child: Text('USD'),),
                        PopupMenuItem(value: 'AED',child: Text('AED'),),
                      ],
                      onSelected: (value) {
                        setState(() {
                          _selectedCurrency = value;
                          currencyController.text = _selectedCurrency.toString();
                        });
                      },
                    ),
                    focusedBorder:const OutlineInputBorder(
                        borderSide: BorderSide(
                      color: kfontColor,
                    )),
                    border:const  OutlineInputBorder()),
                      
                    ),
                  ),
                  widthInRow,
                  
                  Expanded(
                    child: TextField(
                      controller: initialSalaryController,
                        decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                       
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                        color: kfontColor,
                      )),
                      border:OutlineInputBorder()),
                    ),
                  ),
                  widthInRow,
                  const Text('to'),
                  widthInRow,
                  Expanded(
                    child: TextField(
                      controller: finalSalaryController,
                        decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                       
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                        color: kfontColor,
                      )),
                      border:OutlineInputBorder()),
                    ),
                  ),
                  widthInRow,
                  const Text('per year'),
                  widthInRow
                ],
              ),
              ksizedBoxHeight,
              const Text('Perks',style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13
              ),),
              kheightinRec,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: perk1Value, 
                        onChanged: (bool? value) {  
                            setState(() {  
                              perk1Value = !perk1Value;  
                            });  
                          }, 
                          
                          activeColor: kfontColor ),
                         Text('5 Days a Week',style: TextStyle(
                          color: kfontColor
                         ),),
                    ],
                  ) ,
                     Row(
                       children: [
                         Checkbox(
                                             value: perk2Value, 
                                             onChanged: (bool? value) {  
                            setState(() {  
                              perk2Value = !perk2Value;  
                            });  
                          }, 
                          
                          activeColor: kfontColor ),
                         Text('Health Insurance',style: TextStyle(
                          color: kfontColor
                         ),),
                       ],
                     ) 
                ],
              ),
              Row(
                children: [
                  Checkbox(
                                                 value: perk3Value, 
                                                 onChanged: (bool? value) {  
                                setState(() {  
                                  perk3Value = !perk3Value;  
                                });  
                              }, 
                              
                              activeColor: kfontColor ),
                               Text('Life Insurance',style: TextStyle(
                          color: kfontColor
                         ),),
                ],
              ),
                        
            ],
          ),
        )
      ],
    );
  }
}