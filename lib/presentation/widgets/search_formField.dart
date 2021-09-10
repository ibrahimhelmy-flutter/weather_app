import 'package:flutter/material.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/utils/component.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required GlobalKey<FormState> form,
    required this.search,
  }) : _form = form, super(key: key);

  final GlobalKey<FormState> _form;
  final TextEditingController search;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 5),
        child: TextFormField(
          controller: search,
          style: TextStyle(fontSize: 18, color: Colors.black87),
          textInputAction: TextInputAction.go,
          validator: (v) => validateSearchField(v!),
          onFieldSubmitted: (_) {
            if (_form.currentState!.validate()) {WeatherCubit.get(context)
                .getWeatherSearchData(cityNames: search.text);}

          },
          decoration: InputDecoration(
            // labelText: 'Search city...',
            // errorText: validatePassword(search.text),

            filled: true,
            fillColor: Color.fromRGBO(205, 212, 228, 0.2),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(50)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(50)),
            contentPadding: EdgeInsets.all(10),
            suffixIcon: IconButton(
              onPressed: () async {
                if (_form.currentState!.validate()) {
                  WeatherCubit.get(context)
                      .getWeatherSearchData(cityNames: search.text);
                }
              },
              icon: Icon(Icons.search),
              iconSize: 30,
              color: Colors.black87,
            ),
            hintText: "Search city...",
            hintStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.black54),
          ),
        ),
      ),
    );
  }
}