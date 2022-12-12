import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:restore_the_shore_flutter/leaderboard/utils/leaderboard_utils.dart';
import '../model/quote.dart';

class QuoteWidget extends StatefulWidget {
  final CookieRequest request;

  const QuoteWidget(
    {super.key, required CookieRequest request}) : this.request = request;

  @override
  State<QuoteWidget> createState() => _QuoteWidgetState(request);
}

class _QuoteWidgetState extends State<QuoteWidget> {
  late CookieRequest request;
  late Future<List<Quote>> quote = fetchQuote(request);
  String quoteInput = "";
  final _formKeyQuote = GlobalKey<FormState>();

  _QuoteWidgetState(CookieRequest request) {
    this.request = request;
  }

  void searchQuote(String username) async {
    setState(() async {
      var respStr = await postQuote(request, username);

      if (respStr.toString() == "OK") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Quote has been added!"),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        FutureBuilder(
            future: quote,
            builder: (context, AsyncSnapshot snapshotQ) {

              if (snapshotQ.data == null) {
                return const Center(child: CircularProgressIndicator.adaptive());
              }
              if (!snapshotQ.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "There is no Quote in database. :(", 
                        style: TextStyle(color: Color(0xff59A5D8), fontSize: 16)
                      ),
                      SizedBox(height: 8,)
                    ],
                  );
                } else {
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 187, 187, 187),
                      borderRadius: BorderRadius.circular(15.0), 
                    ),
                    child: Column(children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '"${snapshotQ.data![0].randomQuote}"',
                              textAlign: TextAlign.center,
                              ),
                            )
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              '~ by: ${snapshotQ.data![0].name} ~',
                              textAlign: TextAlign.right,
                              ),
                            )
                        ],
                      ),
                    ],),
                  );
                }
              }
            ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text("Congratulate and motivate your friends!"),
                  Row(
                    children: [
                      Expanded(
                        child: Form(
                          key: _formKeyQuote,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Write your message...",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    constraints: BoxConstraints(maxHeight: 36),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                  ),
                                  // Validator sebagai validasi form
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return 'Pesan tidak boleh kosong!';
                                    }
                                    return null;
                                  },
                                  onChanged: (String? value) {
                                    setState(() {
                                        quoteInput = value!;
                                    });
                                  },
                                  // Menambahkan behavior saat data disimpan
                                  onSaved: (String? value) {
                                    setState(() {
                                        quoteInput = value!;
                                    });
                                  },
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKeyQuote.currentState!.validate()) {
                            searchQuote(quoteInput);
                          }
                        },
                        child: const Text("Send"),
                      )
                    ],
                  ),
                ],
              ),
          ),
        ],
      );
  }
}