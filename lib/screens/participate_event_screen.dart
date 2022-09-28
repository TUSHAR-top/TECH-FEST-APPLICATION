import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PartcipateEventScreen extends StatefulWidget {
  final String eventName;
  const PartcipateEventScreen(this.eventName, {super.key});

  @override
  State<PartcipateEventScreen> createState() => _PartcipateEventScreenState();
}

class _PartcipateEventScreenState extends State<PartcipateEventScreen> {
  late Razorpay razorpay;

  @override
  void initState() {
    super.initState();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleWalletPayment);
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    print('Payment Success');
  }

  void handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error');
  }

  void handleWalletPayment(ExternalWalletResponse response) {
    print('External wallet');
  }

  void opencheckout() {
    var options = {
      "key": "rzp_test_v4t1u3loKYqaAr",
      "amount": 200 * 100,
      "name": "fest",
      "description": "Registration fee for ${widget.eventName}",
      'prefill': {
        "contact": "7985403214",
        "email": "abhay95425@gmail.com",
      },
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.25),
              child: AppBar(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.purple,
                title: const Text(
                  'PARTICIPATION FORM',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.white,
          ),
          Positioned(
            top: 110,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          widget.eventName.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.purple,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Starts at',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '30-09-2022 11:00 am',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                'ends at',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '30-09-2022 17:00 pm',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                'Registration Fees',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '200 Rs.',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text('FILL UP FORM',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'FULL NAME',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        enabled: true,
                        decoration: const InputDecoration(
                            hintText: 'enter your Name',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0)),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'EMAIL ADDRESS',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        enabled: true,
                        decoration: const InputDecoration(
                            hintText: 'enter your email',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0)),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'PHONE NUMBER',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(height: 1, fontSize: 14),
                            hintText: 'enter your phone no.',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0)),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'RESIDENTIAL ADDRESS',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextFormField(
                        enabled: true,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: 'enter your current address',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0)),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: SizedBox(
                          height: 40,
                          width: 200,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: Colors.purple),
                              onPressed: () {
                                opencheckout();
                              },
                              child: const Text(
                                'PAY FEES',
                                style: TextStyle(fontSize: 17),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
