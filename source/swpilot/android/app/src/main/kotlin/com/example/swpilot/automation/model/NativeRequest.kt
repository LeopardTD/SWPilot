package com.example.swpilot.automation.model

import com.example.swpilot.automation.operation.NativeOperation

/**
 * Data model representing a request received from Flutter MethodChannel.
 */
data class NativeRequest(
    val operation: NativeOperation?,
    val parameters: Map<String, Any?> = emptyMap()
) {
    companion object {
        fun fromMap(map: Map<*, *>?): NativeRequest {
            if (map == null) return NativeRequest(null)
            val opName = map["operation"] as? String
            @Suppress("UNCHECKED_CAST")
            val params = map["parameters"] as? Map<String, Any?> ?: emptyMap()
            return NativeRequest(
                operation = NativeOperation.fromString(opName),
                parameters = params
            )
        }
    }
}
