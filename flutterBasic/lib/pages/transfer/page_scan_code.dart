import 'package:flutter/material.dart';
import 'package:one_pay/generated/l10n.dart';
import 'package:one_pay/widgets/custom_app_bar.dart';
import 'package:one_pay/widgets/custom_scaffold.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class TransferScanCodePage extends StatefulWidget {
  const TransferScanCodePage({Key? key}) : super(key: key);

  @override
  State<TransferScanCodePage> createState() => _TransferScanCodePageState();
}

class _TransferScanCodePageState extends State<TransferScanCodePage> {
  String? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isShowMessage = false; //是否显示错误信息
  bool _flashOn = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: Text(S.current.transfer_qrcode_scan),
      ),
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: _buildQrView(context),
            ),
            Positioned(
              bottom: 80,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Text(
                      isShowMessage ? S.current.sacn_result_error : " ",
                      style: const TextStyle(color: Colors.red),
                    ),
                    IconButton(
                        onPressed: () async {
                          await controller?.toggleFlash();
                          setState(() {
                            _flashOn = !_flashOn;
                          }); //开关闪光灯
                        },
                        icon: FutureBuilder(
                          future: controller?.getFlashStatus(),
                          builder: (context, snapshot) {
                            return Image.asset(
                              'assets/images/transfer/icon_flash.png',
                              width: 40,
                              height: 40,
                            );
                          },
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //扫描框
  Widget _buildQrView(BuildContext context) {
//在这个例子中，我们检查设备的宽度或高度，并相应地改变扫描区域和覆盖。
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 400.0;
    // 确保扫描仪视图在旋转后大小正确
    // 我们需要监听Flutter SizeChanged通知和更新控制器
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: const Color(0xff464646),
          borderRadius: 0,
          borderLength: 30,
          borderWidth: 0,
          cutOutSize: scanArea,
          overlayColor: const Color.fromRGBO(25, 52, 92, 0.5)),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  ///扫描结果出来
  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        if (scanData.code != '') {
          // controller.pauseCamera();
          _decodeResult(scanData.code);
        }
      });
    });
  }

  //扫描结果出来后需要进行解密，再判断里面的字段是否包含关键字段
  _decodeResult(String? result) {}

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('no Permission')),
      // );
    }
  }
}
