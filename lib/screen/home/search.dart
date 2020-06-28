import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klimatic/Provider/cityProvider.dart';
import 'package:klimatic/model/model.dart';
import 'package:klimatic/screen/7dayforcast.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  final Function() callback;

  const SearchBar({Key key, this.snapshot, this.callback}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    CityProvider cityProvider = Provider.of<CityProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: isSearch
            ? TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Enter City name',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            isSearch = !isSearch;
                          });
                        }),
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onSubmitted: (value) {
                  setState(() {
                    cityProvider.cityUpdate(value);
                    widget.callback();
                    isSearch = !isSearch;
                  });
                },
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.search,
                        color: Colors.white,
                      ),
                      tooltip: "Seach",
                      onPressed: () {
                        setState(() {
                          isSearch = !isSearch;
                        });
                      }),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.alignLeft,
                        color: Colors.white,
                      ),
                      tooltip: "More Details",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MoreDetails(snapshot: widget.snapshot)));
                      })
                ],
              ),
      ),
    );
  }
}
