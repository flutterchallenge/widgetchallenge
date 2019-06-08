import 'package:flutter/material.dart';
import 'package:flutterchallenge/countrylist.dart';

/**
 * @Author: Yubaraj Poudel
 * @Since: 2019/06/07
 * Forms with all basic components
 */
final formKey = new GlobalKey<FormState>();
// Color Converter
_hexToColor(String code) =>
    Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

//InputValidators
_ifNull(val) => val == null ? "Value is null" : "Value is empty";

//TextStyle
_textStyle() => TextStyle(color: _hexToColor("#F2A03D"), fontSize: 14.0);

//InputDecoration
_inputDecoration(label) => InputDecoration(
    labelText: label,
    fillColor: Colors.white,
    border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(18.0),
        borderSide: new BorderSide()));

//InputDecoration with suffix icon
_inputWithSuffixDecoration(label, suffixIcon) => InputDecoration(
    labelText: label,
    fillColor: Colors.white,
    suffixIcon: suffixIcon,
    border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(18.0),
        borderSide: new BorderSide()));

//InputNameText field
_inputNameField() => TextFormField(
      decoration: _inputDecoration("User Name"),
      validator: (val) => _ifNull(val),
      style: _textStyle(),
    );

//InputPasswordText field
_inputPasswordField(bool show, handleShowHidePassword) => TextFormField(
      decoration: _inputWithSuffixDecoration(
          "Password",
          IconButton(
            icon: show ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
            onPressed: () => handleShowHidePassword(show),
          )),
      obscureText: show,
      validator: (val) => _ifNull(val),
      style: _textStyle(),
    );

//EmailInputField
_emailInputField() => TextFormField(
      decoration: _inputDecoration("Email"),
      validator: (val) => _ifNull(val),
      style: _textStyle(),
      keyboardType: TextInputType.emailAddress,
    );

//Phone Number
_phoneInputField() => TextFormField(
      decoration: _inputDecoration("Phone Number"),
      validator: (val) => _ifNull(val),
      style: _textStyle(),
      keyboardType: TextInputType.phone,
    );

//Address
_addressInputFiled() => TextFormField(
      decoration: _inputDecoration("Adresss"),
      validator: (val) => _ifNull(val),
      style: _textStyle(),
      maxLines: 5,
      keyboardType: TextInputType.text,
    );

//Radio button (Gender)
_genderRadio(int groupValue, handleRadioValueChanged) =>
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        'Gender',
        style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      Row(
        children: <Widget>[
          Radio(
              value: 0,
              groupValue: groupValue,
              onChanged: handleRadioValueChanged),
          Text(
            "Male",
            style: new TextStyle(
              fontSize: 14.0,
            ),
          ),
          Radio(
              value: 1,
              groupValue: groupValue,
              onChanged: handleRadioValueChanged),
          Text(
            "Male",
            style: new TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      )
    ]);

//Spinner Country
_countryWidget(currentCountry, changedDropDownItem) => new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Text(
          "Choose your country: ",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        new DropdownButton(
          value: currentCountry,
          items: List<String>.from(countryList)
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(width: 200, child: Text(value)),
            );
          }).toList(),
          onChanged: changedDropDownItem,
        )
      ],
    );

//CheckBoxes(Education)
_checkbox(title, int index, bool boolValue, handleCheckBox) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Checkbox(
        value: boolValue,
        onChanged: (bool value) {
          boolValue = value;
          handleCheckBox(index, boolValue);
        },
      ),
      Text(title),
    ],
  );
}

//Switch class
_acceptSwitch(bool switchOn, onSwitchChanged) => Switch(
      onChanged: onSwitchChanged,
      value: switchOn,
      activeColor: Colors.blue,
      activeTrackColor: Colors.green,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.red,
      activeThumbImage: Image.asset('assets/images/flutter.png').image,
    );

//Submit(Raised Button)
_submitForm() => RaisedButton(
      onPressed: () {},
      child: Text("Submit Form"),
    );

//Reset(Caancel)
_resetForm() => RaisedButton.icon(
    onPressed: () {}, icon: Icon(Icons.close), label: Text("Reset Form"));

class Forms extends StatefulWidget {
  Forms() : super(key: formKey);

  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  List eduSelection = [false, false, false, false];
  String currentCountry = "Nepal";
  int _groupValue = -1;
  bool _show = true;
  bool _accept = true;

  void _handleCheckBox(int index, bool isActive) {
    setState(() {
      this.eduSelection[index] = isActive;
    });
  }

  void _changedDropDownItem(value) {
    setState(() {
      this.currentCountry = value;
    });
  }

  void _handleRadioValueChanged(int value) {
    setState(() {
      this._groupValue = value;
    });
  }

  void _handleShowHidePassword(bool show) {
    setState(() {
      this._show = !show;
    });
  }

  void _onSwitchChanged(bool accept) {
    setState(() {
      this._accept = accept;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forms")),
      body: Container(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              _inputNameField(),
              SizedBox(
                height: 8.0,
              ),
              _inputPasswordField(_show, _handleShowHidePassword),
              SizedBox(
                height: 8.0,
              ),
              _emailInputField(),
              SizedBox(
                height: 8.0,
              ),
              _phoneInputField(),
              SizedBox(
                height: 8.0,
              ),
              _addressInputFiled(),
              SizedBox(
                height: 8.0,
              ),
              _countryWidget(currentCountry, _changedDropDownItem),
              SizedBox(
                height: 8.0,
              ),
              _genderRadio(_groupValue, _handleRadioValueChanged),
              Text("Select Education",
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 8.0,
              ),
              _checkbox("School", 0, eduSelection[0], _handleCheckBox),
              _checkbox("Higher education grades", 1, eduSelection[1],
                  _handleCheckBox),
              _checkbox("Undergraduate", 2, eduSelection[2], _handleCheckBox),
              _checkbox("Post Graduate", 3, eduSelection[3], _handleCheckBox),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Love this flutter form",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                  _acceptSwitch(_accept, _onSwitchChanged),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [_submitForm(), _resetForm()])
            ],
          )),
    );
  }
}
