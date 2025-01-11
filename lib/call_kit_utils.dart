import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

class CallKitUtils {
  CallKitUtils._();

  static const uuid = Uuid();

  static Future<void> incomingCall(
      int callType, String? audioSessionMode) async {
    CallKitParams callKitParams = CallKitParams(
      id: uuid.v4(),
      nameCaller: 'Nabin Gurung',
      appName: 'Callkit',
      avatar: 'https://i.pravatar.cc/100',
      handle: '0123456789',
      type: callType, //!! VERY IMPORTANT -> 0: audio, 1: video
      textAccept: 'Accept',
      textDecline: 'Decline',
      missedCallNotification: const NotificationParams(
        showNotification: true,
        isShowCallback: true,
        subtitle: 'Missed call',
        callbackText: 'Call back',
      ),
      duration: 30000,
      extra: <String, dynamic>{'userId': '1a2b3c4d'},
      headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
      android: const AndroidParams(
          isCustomNotification: true,
          isShowLogo: false,
          ringtonePath: 'system_ringtone_default',
          backgroundColor: '#0955fa',
          backgroundUrl: 'https://i.pravatar.cc/500',
          actionColor: '#4CAF50',
          textColor: '#ffffff',
          incomingCallNotificationChannelName: "Incoming Call",
          missedCallNotificationChannelName: "Missed Call",
          isShowCallID: false),
      ios: IOSParams(
          iconName: 'CallKitLogo', //!! AppIcon is the default app icon asset.
          handleType: 'generic',
          //!! Description: Describes the type of handle (identifier) for the call, such as a phone number, email, or other identifier.
          //!! generic: Default handle.
          //!! email: For email-based identifiers.
          //!! number: For phone numbers.
          supportsVideo: true, //!! Enables the video call interface.
          maximumCallGroups:
              2, //!! The maximum number of call groups that can be active at the same time. Example: 2 (allows up to 2 call groups)
          maximumCallsPerCallGroup:
              1, //!! The maximum number of calls allowed in a single call group. Example: 5 (allows up to 5 calls per group)
          audioSessionMode: audioSessionMode ??
              'default', //!! Description: The audio session mode to configure for the call. Example: 'videoChat', 'voiceChat'
          audioSessionActive:
              true, //!! Determines whether the audio session is active during the call
          audioSessionPreferredSampleRate:
              44100.0, //!! The preferred audio sample rate for the call.
          audioSessionPreferredIOBufferDuration:
              0.005, //!! The preferred I/O buffer duration for the audio session.
          supportsDTMF:
              true, //!! Indicates whether the call supports DTMF (Dual-Tone Multi-Frequency signaling).Default: true,
          supportsHolding:
              true, //!! Indicates whether the call supports being held. Default: true,
          supportsGrouping:
              false, //!! Indicates whether the call supports being added to a group.Default: true
          supportsUngrouping:
              false, //!! Indicates whether the call supports being removed from a group.Default: true
          ringtonePath:
              'system_ringtone_default', //!! Path to a custom ringtone to play for the incoming call.
          configureAudioSession:
              true //!! Indicates whether to configure the audio session automatically.Default: true
          ),
    );
    await FlutterCallkitIncoming.showCallkitIncoming(callKitParams);
  }

  static Future<void> setCallConnected() async {
    await FlutterCallkitIncoming.setCallConnected(uuid.v4());
  }

  static void setUpCallKitEventListeners() async {
    FlutterCallkitIncoming.onEvent.listen((CallEvent? event) async {
      if (event != null) {
        switch (event.event) {
          case Event.actionCallIncoming:
            // TODO: received an incoming call
            await actionCallIncoming(event.body);
            break;
          case Event.actionCallStart:
            await actionCallStart(event.body);
            // TODO: started an outgoing call
            // TODO: show screen calling in Flutter
            break;
          case Event.actionCallAccept:
            await actionCallAccept(event.body);
            // TODO: accepted an incoming call
            // TODO: show screen calling in Flutter
            break;
          case Event.actionCallDecline:
            await actionCallDecline(event.body);
            // TODO: declined an incoming call
            break;
          case Event.actionCallEnded:
            await actionCallEnded(event.body);
            // TODO: ended an incoming/outgoing call
            break;
          case Event.actionCallTimeout:
            await actionCallTimeout(event.body);
            // TODO: missed an incoming call
            break;
          case Event.actionCallCallback:
            await actionCallCallback(event.body);
            // TODO: only Android - click action `Call back` from missed call notification
            break;
          case Event.actionCallToggleHold:
            await actionCallToggleHold(event.body);
            // TODO: only iOS
            break;
          case Event.actionCallToggleMute:
            await actionCallToggleMute(event.body);
            // TODO: only iOS
            break;
          case Event.actionCallToggleDmtf:
            await actionCallToggleDmtf(event.body);
            // TODO: only iOS
            break;
          case Event.actionCallToggleGroup:
            await actionCallToggleGroup(event.body);
            // TODO: only iOS
            break;
          case Event.actionCallToggleAudioSession:
            await actionCallToggleAudioSession(event.body);
            // TODO: only iOS
            break;
          case Event.actionDidUpdateDevicePushTokenVoip:
            await actionDidUpdateDevicePushTokenVoip(event.body);
            // TODO: only iOS
            break;
          case Event.actionCallCustom:
            await actionCallCustom(event.body);
            // TODO: for custom action
            break;
        }
      }
    });
  }

  static Future<void> actionCallIncoming(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionCallIncoming",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<void> actionCallStart(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionCallStart",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<void> actionCallAccept(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionCallAccept",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<void> actionCallDecline(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionCallDecline",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<void> actionCallEnded(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionCallEnded",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<void> actionCallTimeout(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionCallTimeout",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<void> actionCallCallback(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionCallCallback",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<void> actionCallToggleHold(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionCallToggleHold",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<void> actionCallToggleMute(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionCallToggleMute",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<void> actionCallToggleDmtf(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionCallToggleDmtf",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<void> actionCallToggleGroup(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionCallToggleGroup",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<void> actionCallToggleAudioSession(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionCallToggleAudioSession",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<void> actionDidUpdateDevicePushTokenVoip(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionDidUpdateDevicePushTokenVoip",
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static Future<void> actionCallCustom(dynamic body) async {
    Fluttertoast.showToast(
      msg: "actionCallCustom",
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
