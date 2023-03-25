import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class CustomPhoneInputField extends StatefulWidget {
  late String? label;
  late String? hintText;

   CustomPhoneInputField({Key? key, this.label, this.hintText}) : super(key: key);

  @override
  State<CustomPhoneInputField> createState() => _CustomPhoneInputFieldState();
}

class _CustomPhoneInputFieldState extends State<CustomPhoneInputField> {
  Country selectedCountry = Country(
      phoneCode: "94",
      countryCode: "LK",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Sri Lanka",
      example: "Sri Lanka",
      displayName: "Sri Lanka",
      displayNameNoCountryCode: "LK",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
         Text(
          "${widget.label}",
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
            maxLength: 15,
            keyboardType: TextInputType.phone,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintText: "${widget.hintText}",
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 16),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black)),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                                bottomSheetHeight: 500,
                                borderRadius: BorderRadius.circular(13)),
                            onSelect: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            });
                      },
                      child: Text(
                        "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(width: 2, height: 30, color: AppColors.gray5),
                  ],
                ),
              ),
            )),]
      ),
    );
  }
}
