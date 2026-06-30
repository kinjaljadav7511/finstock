import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme_export.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        secondary: AppColors.info,
        onSecondary: AppColors.onInfo,
        error: AppColors.error,
        onError: AppColors.onError,
        surface: AppColors.surface,
        onSurface: AppColors.textPrimary,
        surfaceContainerHighest: AppColors.gray100,
        outline: AppColors.borderStrong,
        outlineVariant: AppColors.border,
        shadow: AppShadows.shadowColorMedium,
      ),

      scaffoldBackgroundColor: AppColors.surface,
      //AppColors.background
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleSpacing: AppSpacing.spacing16,
        toolbarHeight: AppSpacing.appBarHeight,
        titleTextStyle: AppTextStyle.h2(),
        iconTheme: IconThemeData(
          color: AppColors.textPrimary,
          size: AppSpacing.iconSize24,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        shadowColor: AppShadows.shadowColorMedium,
      ),

      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shadowColor: AppShadows.shadowColorMedium,
        shape: RoundedRectangleBorder(borderRadius: AppBorders.borderRadiusLG),
        margin: EdgeInsets.zero,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          disabledBackgroundColor: AppColors.gray300,
          disabledForegroundColor: AppColors.textDisabled,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: AppSpacing.buttonPadding,
          minimumSize: Size(double.infinity, AppSpacing.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorders.borderRadiusMD,
          ),
          textStyle: AppTextStyle.buttonLarge(),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: AppSpacing.buttonPadding,
          textStyle: AppTextStyle.buttonMedium(),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorders.borderRadiusMD,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.borderStrong, width: 1),
          padding: AppSpacing.buttonPadding,
          minimumSize: Size(double.infinity, AppSpacing.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: AppBorders.borderRadiusMD,
          ),
          textStyle: AppTextStyle.buttonLarge(),
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorders.radiusFull),
        ),
        iconSize: AppSpacing.iconSize24,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputBackground,
        border: OutlineInputBorder(
          borderRadius: AppBorders.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.inputBorder, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppBorders.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.inputBorder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppBorders.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.focusRing, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppBorders.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppBorders.borderRadiusMD,
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        contentPadding: AppSpacing.inputPadding,
        hintStyle: AppTextStyle.inputHint(),
        labelStyle: AppTextStyle.labelMedium(),
        floatingLabelStyle: AppTextStyle.labelSmall(color: AppColors.primary),
      ),

      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        backgroundColor: AppColors.white,
        height: AppSpacing.bottomNavHeight,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          return AppTextStyle.labelSmall(
            color: states.contains(WidgetState.selected)
                ? AppColors.primary
                : AppColors.gray800,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          return IconThemeData(
            color: states.contains(WidgetState.selected)
                ? AppColors.primary
                : AppColors.gray800,
          );
        }),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: AppColors.gray100,
        selectedColor: AppColors.primary,
        disabledColor: AppColors.gray100,
        padding: AppSpacing.chipPadding,
        labelStyle: AppTextStyle.buttonSmall(),
        side: const BorderSide(color: Colors.transparent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorders.radiusFull),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: AppBorders.borderRadiusXL),
        titleTextStyle: AppTextStyle.h3(),
        contentTextStyle: AppTextStyle.bodyMedium(),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorders.bottomSheetRadius,
        ),
        modalBackgroundColor: AppColors.surface,
        modalElevation: 0,
      ),

      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 1,
      ),

      listTileTheme: ListTileThemeData(
        contentPadding: AppSpacing.listItemPadding,
        titleTextStyle: AppTextStyle.bodyLargeMedium(),
        subtitleTextStyle: AppTextStyle.bodySmall(),
        iconColor: AppColors.textSecondary,
        shape: RoundedRectangleBorder(borderRadius: AppBorders.borderRadiusMD),
      ),

      // ===== SWITCH =====
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.surface;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryLight;
          }
          return AppColors.gray300;
        }),
      ),

      // ===== CHECKBOX =====
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.onPrimary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      // ===== RADIO =====
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.textSecondary;
        }),
      ),

      // ===== SNACKBAR =====
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.gray900,
        contentTextStyle: AppTextStyle.bodyMedium(color: AppColors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: AppBorders.borderRadiusMD),
      ),

      // ===== PROGRESS INDICATOR =====
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.primaryLight,
        circularTrackColor: AppColors.primaryLight,
      ),

      // ===== TEXT THEME =====
      textTheme: getAppTextTheme(),

      // ===== TYPOGRAPHY =====
      fontFamily: AppTextStyle.fontFamily,

      // ===== ICON THEME =====
      iconTheme: IconThemeData(
        color: AppColors.textPrimary,
        size: AppSpacing.iconSize20,
      ),

      // ===== PLATFORM BRIGHTNESS =====
      brightness: Brightness.light,
    );
  }

  // ==================== DARK THEME (OPTIONAL) ====================
  // Uncomment and customize if you need dark mode support

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: AppColors.textPrimary,
        surface: AppColors.gray900,
        onSurface: AppColors.white,
        error: AppColors.error,
        onError: AppColors.onError,
      ),
      scaffoldBackgroundColor: AppColors.black,
      // ... Add dark theme configurations
    );
  }
}

// ==================== THEME EXTENSIONS ====================

/// Custom theme extension for additional design tokens
@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final BoxDecoration cardDecoration;
  final BoxDecoration elevatedCardDecoration;
  final BoxDecoration fabDecoration;

  const AppThemeExtension({
    required this.cardDecoration,
    required this.elevatedCardDecoration,
    required this.fabDecoration,
  });

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    BoxDecoration? cardDecoration,
    BoxDecoration? elevatedCardDecoration,
    BoxDecoration? fabDecoration,
  }) {
    return AppThemeExtension(
      cardDecoration: cardDecoration ?? this.cardDecoration,
      elevatedCardDecoration:
          elevatedCardDecoration ?? this.elevatedCardDecoration,
      fabDecoration: fabDecoration ?? this.fabDecoration,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
    covariant ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) return this;
    return this;
  }

  static AppThemeExtension get light => AppThemeExtension(
    cardDecoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: AppBorders.borderRadiusLG,
      boxShadow: AppShadows.card,
    ),
    elevatedCardDecoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: AppBorders.borderRadiusLG,
      boxShadow: AppShadows.md,
    ),
    fabDecoration: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(AppBorders.radiusFull),
      boxShadow: AppShadows.fab,
    ),
  );
}
