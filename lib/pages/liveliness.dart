import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewScreen extends StatefulWidget {
  final String step;
  CameraPreviewScreen({required this.step});

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
  }

  void _onNext() {
    if (_isImageCaptured) {
      if (widget.step == 'selfie') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CameraPreviewScreen(step: 'nicFront'),
          ),
        );
      } else if (widget.step == 'nicFront') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CameraPreviewScreen(step: 'nicBack'),
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
      appBar: AppBar(
        title: Text(
          'Liveliness Test - ${widget.step == 'selfie'
              ? 'Selfie'
              : widget.step == 'nicFront'
              ? 'NIC Front'
              : 'NIC Back'}',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please take your ${widget.step == 'selfie'
                  ? 'selfie'
                  : widget.step == 'nicFront'
                  ? 'NIC Front'
                  : 'NIC Back'} image:',
            ),
            SizedBox(height: 20),
            _isCameraInitialized
                ? CameraPreview(_cameraController)
                : Center(child: CircularProgressIndicator()),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _captureImage,
              child: Text('Capture Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _onNext, child: Text('Next')),
          ],
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
