import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFullButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final VoidCallback? onTap;
  final double fontSize;
  final bool isLoading;
  final double width;

  const CustomFullButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.textColor = Colors.white,
    this.fontSize = 14,
    this.isLoading = false,
    this.width = double.infinity,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: onPressed,
      onDoubleTap: onTap,
      child: Container(
        height: 45,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: isLoading == false
              ? Text(
                  text,
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600),
                )
              : const CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}

class CustomFullButtonWithIcon extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final double fontSize;
  final bool isLoading;
  final Widget trailingIcon;
  final double height;

  const CustomFullButtonWithIcon({
    super.key,
    required this.text,
    required this.trailingIcon,
    required this.onPressed,
    required this.color,
    this.textColor = Colors.white,
    this.fontSize = 14,
    this.isLoading = false,
    this.height = 45,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: isLoading == false
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600),
                  ),
                  trailingIcon,
                ],
              )
            : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color bgColor;
  final VoidCallback onPressed;
  final double? width;

  const CustomOutlinedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color,
      this.width = double.infinity,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: onPressed,
      child: Container(
        height: 45,
        width: width,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color)),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
                color: color, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class CustomOutlinedIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final Color borderColor;
  final double height;
  final double radius;
  final double width;
  final double fontSize;
  final double borderWidth;

  final VoidCallback onPressed;

  const CustomOutlinedIconButton({
    super.key,
    required this.text,
    this.height = 45,
    this.width = double.infinity,
    required this.onPressed,
    required this.color,
    this.borderColor = Colors.transparent,
    required this.bgColor,
    required this.icon,
    required this.fontSize,
    this.radius = 8,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: borderColor, width: borderWidth)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 16,
            ),
            const Gap(3),
            Text(
              text,
              style: GoogleFonts.poppins(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomImageButton extends StatelessWidget {
  final String image;
  final Color color;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const CustomImageButton(
      {super.key,
      required this.width,
      required this.height,
      required this.onPressed,
      required this.color,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color)),
        child: Center(
          child: Image(
            image: AssetImage(image),
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
  }
}

class ImgButton extends StatelessWidget {
  final double fontSize;
  final String text;
  final String image;
  final Color color;
  final Color bgColor;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const ImgButton({
    super.key,
    required this.width,
    required this.height,
    required this.onPressed,
    required this.color,
    required this.image,
    required this.bgColor,
    this.fontSize = 16,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              height: 20,
              width: 20,
              image,
            ),
            const Gap(8),
            Text(
              text,
              style: TextStyle(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
