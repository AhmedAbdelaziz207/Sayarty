import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlexibleDialog extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? message;
  final String? phoneNumber;
  final String? phoneButtonLabel;
  final VoidCallback? onPhoneButtonTap;

  final String? primaryButtonText;
  final VoidCallback? onPrimaryTap;

  final String? secondaryButtonText;
  final VoidCallback? onSecondaryTap;

  final Color? iconColor;

  const FlexibleDialog({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.phoneNumber,
    this.phoneButtonLabel,
    this.onPhoneButtonTap,
    this.primaryButtonText,
    this.onPrimaryTap,
    this.secondaryButtonText,
    this.onSecondaryTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Icon(
              icon,
              color: iconColor ?? Colors.orange,
              size: 48,
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              title,
              style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Optional Message
            if (message != null) ...[
              const SizedBox(height: 8),
              Text(
                message!,
                style: GoogleFonts.cairo(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
            ],

            // Optional phone number section
            if (phoneNumber != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      phoneNumber!,
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (phoneButtonLabel != null && onPhoneButtonTap != null)
                      IconButton(
                        onPressed: onPhoneButtonTap,
                        icon: const Icon(Icons.copy, color: Colors.black),
                      ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 20),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (secondaryButtonText != null && onSecondaryTap != null)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onSecondaryTap,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        secondaryButtonText!,
                        style: GoogleFonts.cairo(color: Colors.black),
                      ),
                    ),
                  ),
                if (secondaryButtonText != null) const SizedBox(width: 12),
                if (primaryButtonText != null && onPrimaryTap != null)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onPrimaryTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        primaryButtonText!,
                        style: GoogleFonts.cairo(),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
