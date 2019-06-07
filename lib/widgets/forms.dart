import 'package:flutter/material.dart';
import 'package:flutterchallenge/countrylist.dart';

/**
 * @Author: Yubaraj Poudel
 * @Since: 2019/06/07
 * Forms with all basic components
 */

// Color Converter
_hexToColor(String code) =>
    Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

//InputValidators
_ifNull(val) => val == null ? "Value is null" : "Value is empty";

//TextStyle
_textStyle() => TextStyle(color: _hexToColor("#F2A03D"), fontSize: 14.0);

//InputDecoration
_inputDecoration(label) =>
    InputDecoration(
        labelText: label,
        fillColor: Colors.white,
        border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(18.0),
            borderSide: new BorderSide()));

//InputDecoration with suffix icon
_inputWithSuffixDecoration(label, suffixIcon) =>
    InputDecoration(
        labelText: label,
        fillColor: Colors.white,
        suffixIcon: suffixIcon,
        border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(18.0),
            borderSide: new BorderSide()));

//InputNameText field
_inputNameField() =>
    TextFormField(
      decoration: _inputDecoration("User Name"),
      validator: (val) => _ifNull(val),
      style: _textStyle(),
    );

//InputPasswordText field
_inputPasswordField() =>
    TextFormField(
      decoration:
      _inputWithSuffixDecoration("Password", Icon(Icons.remove_red_eye)),
      obscureText: true,
      validator: (val) => _ifNull(val),
      style: _textStyle(),
    );

//EmailInputField
_emailInputField() =>
    TextFormField(
      decoration: _inputDecoration("Email"),
      validator: (val) => _ifNull(val),
      style: _textStyle(),
      keyboardType: TextInputType.emailAddress,
    );

//Phone Number
_phoneInputField() =>
    TextFormField(
      decoration: _inputDecoration("Phone Number"),
      validator: (val) => _ifNull(val),
      style: _textStyle(),
      keyboardType: TextInputType.phone,
    );
//Address

_addressInputFiled() =>
    TextFormField(
      decoration: _inputDecoration("Adresss"),
      validator: (val) => _ifNull(val),
      style: _textStyle(),
      maxLines: 5,
      keyboardType: TextInputType.text,
    );

//RADIO
int _groupValue = 0;

void _handleRadioValueChanged(Object value) {}
//Radio button (Gender)
_genderRadio() =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
      Text(
        'Gender',
        style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      Row(children: <Widget>[
        Radio(
            value: "1",
            groupValue: _groupValue,
            onChanged: _handleRadioValueChanged),
        Text(
          "Male",
          style: new TextStyle(
            fontSize: 14.0,
          ),
        ),
        Radio(
            value: "1",
            groupValue: _groupValue,
            onChanged: _handleRadioValueChanged),
        Text(
          "Male",
          style: new TextStyle(
            fontSize: 14.0,
          ),
        ),

      ],)

    ]);

void changedDropDownItem(value) {}

//Spinner Country
var _currentCountry = "Nepal";

_countryWidget() =>
    new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text("Choose your country: ", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
        new DropdownButton(
          value: _currentCountry,
          items: List<String>.from(countryList).map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: changedDropDownItem,
        )
      ],
    );

//CheckBoxes(Education)
_checkbox(String title, bool boolValue) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Checkbox(
        value: boolValue,
        onChanged: (bool value) {},
      ), Text(title),
    ],
  );
}

//Submit(Raised Button)
_submitForm() =>
    RaisedButton(
      onPressed: () {},
      child: Text("Submit Form"),
    );

//Reset(Caancel)
_resetForm() =>
    RaisedButton.icon(
        onPressed: () {}, icon: Icon(Icons.close), label: Text("Reset Form"));

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forms")),
      body: Container(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              _inputNameField(),
              SizedBox(height: 8.0,),
              _inputPasswordField(),
              SizedBox(height: 8.0,),
              _emailInputField(),
              SizedBox(height: 8.0,),
              _phoneInputField(),
              SizedBox(height: 8.0,),
              _addressInputFiled(),
              SizedBox(height: 8.0,),
              _countryWidget(),
              SizedBox(height: 8.0,),
              _genderRadio(),
              Text("Select Education", style: TextStyle(
                  fontSize: 16.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.0,),
              _checkbox("School", true),
              _checkbox("Higher education grades", true),
              _checkbox("Undergraduate", true),
              _checkbox("Post Graduate", true),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [ _submitForm(), _resetForm()])
            ],
          )),
    );
  }
}
