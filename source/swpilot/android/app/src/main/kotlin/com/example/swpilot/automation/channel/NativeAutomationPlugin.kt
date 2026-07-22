package com.example.swpilot.automation.channel

import android.util.Log
import com.example.swpilot.automation.dispatcher.NativeAutomationDispatcher
import com.example.swpilot.automation.model.NativeRequest
import com.example.swpilot.automation.operation.NativeOperation
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * FlutterPlugin establishing MethodChannel communication for Native Automation.
 */
class NativeAutomationPlugin(
    private val dispatcher: NativeAutomationDispatcher = NativeAutomationDispatcher()
) : FlutterPlugin, MethodChannel.MethodCallHandler {

    companion object {
        const val CHANNEL_NAME = "swpilot/native_automation"
        private const val TAG = "NativeAutomationPlugin"
    }

    private var channel: MethodChannel? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, CHANNEL_NAME)
        channel?.setMethodCallHandler(this)
        Log.i(TAG, "Automation Plugin Initialized")
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
        channel = null
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        Log.d(TAG, "Request Received: ${call.method}")

        @Suppress("UNCHECKED_CAST")
        val arguments = call.arguments as? Map<String, Any?>
        val request = if (arguments != null) {
            NativeRequest.fromMap(arguments)
        } else {
            NativeRequest(
                operation = NativeOperation.fromString(call.method),
                parameters = emptyMap()
            )
        }

        val response = dispatcher.dispatch(request)
        Log.d(TAG, "Operation Executed: ${response.message}")
        result.success(response.toMap())
    }
}
