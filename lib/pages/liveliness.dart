import 'package:camera/camera.dart';
import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:ekyc_prototypes/components/status.dart';
import 'package:ekyc_prototypes/pages/address.dart';
import 'package:flutter/material.dart';

class CameraPreviewScreen extends StatefulWidget {
  final String step;
  final bool addressChanged;
  final bool emailChanged;
  final bool mobileChanged;

  CameraPreviewScreen({
    required this.step,
    required this.addressChanged,
    required this.emailChanged,
    required this.mobileChanged,
  });

  @override
  _CameraPreviewScreenState createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  late CameraController _cameraController;
  bool _isCameraInitialized = false;
  bool _isImageCaptured = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _cameraController = CameraController(firstCamera, ResolutionPreset.medium);

    try {
      await _cameraController.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  void _captureImage() {
    setState(() {
      _isImageCaptured = true;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Image captured successfully!')));
  }

  void _onNext() {
    if (_isImageCaptured) {
      if (widget.step == 'selfie') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => CameraPreviewScreen(
                  step: 'nicFront',
                  addressChanged: widget.addressChanged,
                  emailChanged: widget.emailChanged,
                  mobileChanged: widget.mobileChanged,
                ),
          ),
        );
      } else if (widget.step == 'nicFront') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => CameraPreviewScreen(
                  step: 'nicBack',
                  addressChanged: widget.addressChanged,
                  emailChanged: widget.emailChanged,
                  mobileChanged: widget.mobileChanged,
                ),
          ),
        );
      } else if (widget.step == 'nicBack') {
        // Redirect to Address Page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => AddressPage(
                  emailChanged: widget.emailChanged,
                  mobileChanged: widget.mobileChanged,
                ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please take an image first.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //   appBar: AppBar(
      //   title: Text(
      //     'Liveliness Test - ${widget.step == 'selfie'
      //        ? 'Selfie'
      //        : widget.step == 'nicFront'
      //       ? 'NIC Front'
      //       : 'NIC Back'}',
      //   ),
      //  ),
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomerProfileStepper(
                  backButton: false,
                  step1Status: 'completed',
                  step2Status: 'completed',
                  step3Status: 'active',
                  step4Status: 'inactive',
                  activeLabel: 'Verification',
                ),

                SS32(),
                Heading03(
                  text:
                      'Please take your ${widget.step == 'selfie'
                          ? 'selfie'
                          : widget.step == 'nicFront'
                          ? 'NIC Front'
                          : 'NIC Back'} image:',
                  color: Colors.black,
                ),
                SizedBox(height: 20),
                _isCameraInitialized
                    ? CameraPreview(_cameraController)
                    : Center(child: CircularProgressIndicator()),
                SS40(),

                Container(
                  width: 298,
                  child: Column(
                    children: [
                      DGOutlinedButton(
                        onTap: _captureImage,
                        buttonText: 'Capture',
                      ),
                      SS24(),
                      MPrimaryButton(onTap: _onNext, buttonText: 'Next'),

                      //DGOutlinedButton(onTap: () {}, buttonText: 'Cancel'),
                      SS24(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
}
