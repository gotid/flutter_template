import 'package:flutter/material.dart';

const Color contentColor = Color.fromRGBO(38, 38, 47, 1);
const Color secondaryContentColor = Color.fromRGBO(111, 111, 118, 1);
const Color statSeperatorColor = Color.fromRGBO(57, 57, 71, 1);
const Color attentionColor = Color.fromRGBO(0, 152, 255, 1);
const Color skillTextColor = Color.fromRGBO(5, 59, 73, 1);
const Color disabledColor = Color.fromRGBO(116, 116, 126, 1);
const Color disabledTaskColor = Color.fromRGBO(38, 38, 47, 0.25);
const Color modalBackgroundColor = Color.fromRGBO(241, 241, 241, 1);
const Color treeLineColor = Color.fromRGBO(215, 215, 215, 1);

/// 一旦逻辑像素宽超过该值，则使用超大尺寸布局
const double ultraWideLayoutThreshold = 1920;

/// 一旦逻辑像素宽超过该值，则使用大尺寸布局
const double wideLayoutThreshold = 800;

/// 设备的逻辑像素宽度小于该值，将不会允许旋转到横屏模式。
const double blockLandscapeThreshold = 750;

/// 角色网格中理想的角色单元格宽度。用于浏览角色网格时候计算列数。
const double idealCharacterWidth = 135;

/// 雇佣效果的理想直径。
const double idealParticleSize = 10;

/// 模态窗口的最大逻辑像素宽
const double modalMaxWidth = 400;

const TextStyle buttonTextStyle = TextStyle(
  fontFamily: 'MontserratMedium',
  fontSize: 16,
  color: contentColor,
);

const TextStyle contentSmallStyle = TextStyle(
  fontFamily: 'MontserratRegular',
  fontSize: 14,
  color: contentColor,
);

const TextStyle contentStyle = TextStyle(
  fontFamily: 'MontserratRegular',
  fontSize: 16,
  color: contentColor,
);

const TextStyle contentLargeStyle = TextStyle(
  fontFamily: 'MontserratRegular',
  fontSize: 24,
  color: contentColor,
);
