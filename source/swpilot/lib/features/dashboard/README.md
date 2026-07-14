# SWPilot Dashboard Feature

This feature contains the presentation shell of the SWPilot Dashboard.

## Overview
The Dashboard acts as the central command center for managing daily check-ins, automated tasks, checking log history, and viewing overall performance metrics.

## Expected Structure
```text
features/
└── dashboard/
    └── presentation/
        ├── pages/
        │   └── dashboard_page.dart
        └── widgets/
            ├── dashboard_header.dart
            ├── dashboard_content.dart
            ├── dashboard_section.dart
            ├── dashboard_section_header.dart
            ├── dashboard_card.dart
            ├── dashboard_loading_state.dart
            ├── dashboard_empty_state.dart
            ├── dashboard_error_state.dart
            ...
```

## Reusable Components
- **`DashboardSection`**: A consistent wrapper for sections that includes a standard title, an optional subtitle, and the main child content.
- **`DashboardCard`**: A card container preset wrapping the design system `AppCard` with uniform spacing, borders, and margins.
- **UI States (`DashboardLoadingState`, `DashboardEmptyState`, `DashboardErrorState`)**: State feedback widgets utilized for screen data load lifecycle representation.

## Extending the Dashboard
To add a new section to the Dashboard:
1. Create your section widget file in `lib/features/dashboard/presentation/widgets/your_new_section.dart`.
2. Wrap your layout in `DashboardSection`.
3. Integrate it by adding it directly into the column list of `DashboardContent` inside `lib/features/dashboard/presentation/widgets/dashboard_content.dart`.
