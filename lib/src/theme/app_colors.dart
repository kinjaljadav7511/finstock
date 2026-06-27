
import 'package:flutter/material.dart';

class AppColors {

  AppColors._();

  static const Color primary = Color(0xFF4F46E5); // indigo-600
  static const Color primaryDark = Color(0xFF030213); // Very dark blue/black
  static const Color primaryLight = Color(0xFFEEF2FF); // indigo-50
  static const Color primaryContainer = Color(0xFFE0E7FF); // indigo-100
  static const Color onPrimary = Color(0xFFFFFFFF); // White
  

  static const Color focusRing = Color(0xFF6366F1); // indigo-500
  
  
  
  
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);
  
  
  static const Color background = Color(0xFFE5E7EB); // App background
  static const Color surface = Color(0xFFFFFFFF); // Card/surface background
  static const Color surfaceVariant = Color(0xFFF3F4F6); // Alternate surface
  
  static const Color success = Color(0xFF16A34A); // green-600
  static const Color successLight = Color(0xFFF0FDF4); // green-50
  static const Color successDark = Color(0xFF15803D); // green-700
  static const Color successBorder = Color(0xFFBBF7D0); // green-200
  static const Color onSuccess = Color(0xFFFFFFFF);
  

  static const Color error = Color(0xFFDC2626); // red-600
  static const Color errorLight = Color(0xFFFEF2F2); // red-50
  static const Color errorDark = Color(0xFFB91C1C); // red-700
  static const Color errorBorder = Color(0xFFFECACA); // red-200
  static const Color errorDestructive = Color(0xFFD4183D); // Custom destructive
  static const Color onError = Color(0xFFFFFFFF);
  

  static const Color warning = Color(0xFFD97706); // amber-600
  static const Color warningLight = Color(0xFFFFFBEB); // amber-50
  static const Color warningDark = Color(0xFFB45309); // amber-700
  static const Color warningBorder = Color(0xFFFDE68A); // amber-200
  static const Color onWarning = Color(0xFFFFFFFF);
  

  static const Color info = Color(0xFF2563EB); // blue-600
  static const Color infoLight = Color(0xFFEFF6FF); // blue-50
  static const Color infoDark = Color(0xFF1D4ED8); // blue-700
  static const Color infoBorder = Color(0xFFBFDBFE); // blue-200
  static const Color onInfo = Color(0xFFFFFFFF);
  
  static const Color accent = Color(0xFF9333EA); // purple-600
  static const Color accentLight = Color(0xFFFAF5FF); // purple-50
  static const Color onAccent = Color(0xFFFFFFFF);
  
  
  static const Color textPrimary = Color(0xFF111827); // gray-900
  static const Color textSecondary = Color(0xFF4B5563); // gray-600
  static const Color textTertiary = Color(0xFF6B7280); // gray-500
  static const Color textDisabled = Color(0xFF9CA3AF); // gray-400
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  
  
  static const Color border = Color(0x1A000000); // rgba(0, 0, 0, 0.1)
  static const Color borderStrong = Color(0xFFE5E7EB); // gray-200
  
  static const Color inputBackground = Color(0xFFF3F3F5);
  static const Color inputBorder = Color(0xFFE5E7EB);
  
  static const Color divider = Color(0xFFF3F4F6); // gray-100
  
  static const Color scrim = Color(0x80000000); // black with 50% opacity
  static const Color overlay = Color(0x0D000000); // Subtle overlay
  
  static const Color chart1 = Color(0xFFF97316); // Orange/coral
  static const Color chart2 = Color(0xFF06B6D4); // Cyan/teal
  static const Color chart3 = Color(0xFF3B82F6); // Blue
  static const Color chart4 = Color(0xFFEAB308); // Yellow
  static const Color chart5 = Color(0xFFFB923C); // Light orange
  
  static const Map<String, Map<String, Color>> statusColors = {
    'pending': {
      'background': warningLight,
      'text': warningDark,
      'border': warningBorder,
    },
    'completed': {
      'background': successLight,
      'text': successDark,
      'border': successBorder,
    },
    'processing': {
      'background': infoLight,
      'text': infoDark,
      'border': infoBorder,
    },
    'cancelled': {
      'background': errorLight,
      'text': errorDark,
      'border': errorBorder,
    },
    'success': {
      'background': successLight,
      'text': successDark,
      'border': successBorder,
    },
    'warning': {
      'background': warningLight,
      'text': warningDark,
      'border': warningBorder,
    },
    'error': {
      'background': errorLight,
      'text': errorDark,
      'border': errorBorder,
    },
  };
  
  static const Color indigoIconBg = Color(0xFFEEF2FF); // indigo-50
  static const Color blueIconBg = Color(0xFFEFF6FF); // blue-50
  static const Color greenIconBg = Color(0xFFF0FDF4); // green-50
  static const Color amberIconBg = Color(0xFFFFFBEB); // amber-50
  static const Color redIconBg = Color(0xFFFEF2F2); // red-50
  static const Color purpleIconBg = Color(0xFFFAF5FF); // purple-50
  static const Color grayIconBg = Color(0xFFF3F4F6); // gray-100
}
