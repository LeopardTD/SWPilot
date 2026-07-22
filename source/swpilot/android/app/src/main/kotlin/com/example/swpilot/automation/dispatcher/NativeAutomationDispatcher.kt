package com.example.swpilot.automation.dispatcher

import com.example.swpilot.automation.handler.OperationHandler
import com.example.swpilot.automation.model.NativeRequest
import com.example.swpilot.automation.model.NativeResponse
import com.example.swpilot.automation.operation.NativeOperation

/**
 * Dispatcher responsible for routing requests to the appropriate operation handler.
 */
class NativeAutomationDispatcher(
    private val handler: OperationHandler = OperationHandler()
) {

    fun dispatch(request: NativeRequest): NativeResponse {
        val op = request.operation ?: return NativeResponse(
            success = false,
            message = "Unknown Operation"
        )

        return when (op) {
            NativeOperation.INITIALIZE -> handler.initialize()
            NativeOperation.CHECK_PERMISSION -> handler.checkAvailability()
            NativeOperation.CHECK_ACCESSIBILITY -> handler.checkAvailability()
            NativeOperation.START_AUTOMATION -> handler.executeOperation(request)
            NativeOperation.STOP_AUTOMATION -> handler.executeOperation(request)
            NativeOperation.EXECUTE_ACTION -> handler.executeOperation(request)
            NativeOperation.GET_PLATFORM_INFO -> handler.getPlatformInfo()
        }
    }
}
