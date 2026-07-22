package com.example.swpilot.automation.operation

/**
 * Enum representing operations supported by the Native Automation Module.
 * Must stay in sync with Flutter's NativeOperation enum.
 */
enum class NativeOperation {
    INITIALIZE,
    CHECK_PERMISSION,
    CHECK_ACCESSIBILITY,
    START_AUTOMATION,
    STOP_AUTOMATION,
    EXECUTE_ACTION,
    GET_PLATFORM_INFO;

    companion object {
        fun fromString(name: String?): NativeOperation? {
            if (name == null) return null
            return values().firstOrNull { 
                it.name.equals(name, ignoreCase = true) || 
                it.name.replace("_", "").equals(name.replace("_", ""), ignoreCase = true)
            }
        }
    }
}
