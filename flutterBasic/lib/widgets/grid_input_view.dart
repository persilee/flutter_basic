import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_pay/utils/hsg_colors.dart';

class GridInputView extends StatefulWidget {
  final bool isAutofocus;
  final bool isEncryption;
  final int limitLength;
  final double boxSize;
  final Function(String passwordStr)? callBack;
  final Color inputBgColor;
  final Function()? lostFocus;
  final Color cursorColor;
  final bool isDisFocus;
  final bool isEnable;
  const GridInputView({
    Key? key,
    this.isAutofocus = false,
    this.isEncryption = true,
    this.limitLength = 4,
    this.boxSize = 40.0,
    this.callBack,
    this.inputBgColor = HsgColors.themeOPColor,
    this.lostFocus,
    this.cursorColor = Colors.white,
    this.isDisFocus = true,
    this.isEnable = true,
  }) : super(key: key);

  @override
  _GridInputViewState createState() => _GridInputViewState();
}

class _GridInputViewState extends State<GridInputView>
    with WidgetsBindingObserver {
  final TextEditingController _inputTC = TextEditingController();
  final FocusNode _inputFN = FocusNode();
  String _passwordString = '';
  late Timer _timer;
  // bool _isShowKeyboard = false;

  @override
  void initState() {
    _inputTC.addListener(() {
      if (mounted) {
        setState(() {
          _passwordString = _inputTC.text;
          if (_passwordString.length == widget.limitLength) {
            // if (widget.isDisFocus) {
            FocusScope.of(context).requestFocus(FocusNode());
            _inputFN.unfocus();
            // } else {
            //   this.widget.callBack(_passwordString);
            //   _timer = Timer(const Duration(milliseconds: 400), () {
            //     _passwordString = _inputTC.text = '';
            //   });
            // }
          }
        });
      }
    });
    _inputFN.addListener(() {
      if (_inputFN.hasFocus) {
        print('得到焦点');
      } else {
        print('失去焦点');
        // _isShowKeyboard = false;
        if (_inputTC.text.length == widget.limitLength) {
          if (widget.callBack != null) {
            widget.callBack!(_passwordString);
          }
          _timer = Timer(const Duration(milliseconds: 400), () {
            _passwordString = _inputTC.text = '';
          });
        }
      }
    });
    // 创建一个界面变化的观察者
    // WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // 当前是安卓系统并且在焦点聚焦的情况下
      if (Platform.isAndroid) {
        print(
            'MediaQuery.of(context).viewInsets.bottom = ${MediaQuery.of(context).viewInsets.bottom}');
        if (MediaQuery.of(context).viewInsets.bottom == 0) {
          setState(() {
            // _inputFN.unfocus();
            // _isShowKeyboard = false;
          });
          return;
        } else {
          setState(() {
            // _isShowKeyboard = true;
          });
        }
      }
      // if (Platform.isAndroid && _inputFN.hasFocus) {
      //   if (_isShowKeyboard) {
      //     // 使输入框失去焦点
      //     _inputFN.unfocus();
      //     _isShowKeyboard = false;
      //     return;
      //   }
      //   _isShowKeyboard = true;
      // }
    });
  }

  @override
  void dispose() {
    _inputTC.dispose();
    _inputFN.dispose();
    _timer.cancel();
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _passwordBox() {
      List<Widget> _passwordbox = [];
      List<String> _passwordText = _passwordString.split('');
      for (var i = 0; i < widget.limitLength; i++) {
        _passwordbox.add(
          Container(
            width: widget.boxSize,
            height: widget.boxSize,
            margin: const EdgeInsets.only(left: 5, right: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: HsgColors.themeOPColor, width: 0.8),
              borderRadius: const BorderRadius.all(Radius.circular(6.0)),
              color: const Color(0xFFFFFCF6),
            ),
            child: TextButton(
              onPressed: () {
                FocusScope.of(context).requestFocus(_inputFN);
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Container(
                width: widget.boxSize,
                height: widget.boxSize,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                ),
                child: Text(
                  _passwordText.length > i
                      ? widget.isEncryption
                          ? '●'
                          : _passwordText[i]
                      : '',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      }
      return _passwordbox;
    }

    Widget _inputWidget = Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        // padding: EdgeInsets.only(top: 15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _passwordBox(),
          ),
          const Padding(padding: EdgeInsets.only(top: 0)),
          SizedBox(
            height: 1,
            child: TextField(
              //禁止长按双击出现复制粘贴等操作弹窗
              enableInteractiveSelection: false,
              decoration: const InputDecoration(
                border: InputBorder.none, // 去掉下滑线
                counterText: '', // 去除输入框底部的字符计数
              ),
              autofocus: widget.isAutofocus,
              controller: _inputTC,
              focusNode: _inputFN,
              // showCursor: false,
              cursorColor: widget.cursorColor,
              obscureText: widget.isEncryption,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.transparent),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]")), //纯数字
                LengthLimitingTextInputFormatter(widget.limitLength),
              ],
            ),
          ),
        ],
      ),
    );
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(_inputFN);
      },
      child: Container(
        child: _inputWidget,
      ),
    );
  }
}
