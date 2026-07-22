package com.example.swpilot.automation.model

/**
 * Data model representing a response returned to Flutter MethodChannel.
 */
data class NativeResponse(
    val success: Boolean,
    val data: Map<String, Any?> = emptyMap(),
    val message: String = ""
) {
    fun toMap(): Map<String, Any?> {
        return mapOf(
            "success" to success,
            "data" to data,
            "message" to message
        )
    }
}
