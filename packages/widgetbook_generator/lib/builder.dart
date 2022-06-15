import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widgetbook_generator/builders/json_builder.dart';
import 'package:widgetbook_generator/generators/widgetbook_generator.dart';
import 'package:widgetbook_generator/resolvers/app_builder_resolver.dart';
import 'package:widgetbook_generator/resolvers/device_frame_builder_resolver.dart';
import 'package:widgetbook_generator/resolvers/device_resolver.dart';
import 'package:widgetbook_generator/resolvers/locales_resolver.dart';
import 'package:widgetbook_generator/resolvers/localization_builder_resolver.dart';
import 'package:widgetbook_generator/resolvers/localization_delegates_resolver.dart';
import 'package:widgetbook_generator/resolvers/scaffold_builder_resolver.dart';
import 'package:widgetbook_generator/resolvers/text_scale_factor_resolver.dart';
import 'package:widgetbook_generator/resolvers/theme_builder_resolver.dart';
import 'package:widgetbook_generator/resolvers/theme_resolver.dart';
import 'package:widgetbook_generator/resolvers/use_case_builder_resolver.dart';
import 'package:widgetbook_generator/resolvers/use_case_resolver.dart';

/// Builder for the WidgetbookTheme annotation.
/// Creates a .theme.widgetbook.json file for each .dart file containing a
/// WidgetbookTheme annotation
Builder themeBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    ThemeResolver(),
    generatedExtension: '.theme.widgetbook.json',
    formatOutput: _formatOutput,
  );
}

/// Builder for the WidgetbookUseCase annotation.
/// Creates a .usecase.widgetbook.json file for each .dart file containing a
/// WidgetbookStory annotation
Builder storyBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    UseCaseResolver(),
    generatedExtension: '.usecase.widgetbook.json',
    formatOutput: _formatOutput,
  );
}

/// Builder for creating a json which contains all used devices.
/// Creates a .devices.widgetbook.json file for each device used in Widgetbook.
Builder devicesBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    DeviceResolver(),
    generatedExtension: '.devices.widgetbook.json',
    formatOutput: _formatOutput,
  );
}

/// Builder for creating a json which contains all used text scale factors.
/// Creates a .textscalefactors.widgetbook.json file for each text scale factor
/// used in Widgetbook.
Builder textScaleFactorsBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    TextScaleFactorResolver(),
    generatedExtension: '.textscalefactors.widgetbook.json',
    formatOutput: _formatOutput,
  );
}

/// Builder for the WidgetbookLocales annotation.
/// Creates a .locales.widgetbook.json file for each .dart file containing a
/// WidgetbookLocales annotation
Builder localesBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    LocalesResolver(),
    formatOutput: _formatOutput,
    generatedExtension: '.locales.widgetbook.json',
  );
}

/// Builder for the WidgetbookLocalizationDelegates annotation.
/// Creates a .delegates.widgetbook.json file for each .dart file containing a
/// WidgetbookLocales annotation
Builder localizationDelegatesBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    LocalizationDelegatesResolver(),
    formatOutput: _formatOutput,
    generatedExtension: '.delegates.widgetbook.json',
  );
}

/// Builder for [DeviceFrameBuilderResolver]
Builder deviceFrameBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    DeviceFrameBuilderResolver(),
    formatOutput: _formatOutput,
    generatedExtension: '.deviceframebuilder.widgetbook.json',
  );
}

/// Builder for [LocalizationBuilderResolver]
Builder localizationBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    LocalizationBuilderResolver(),
    formatOutput: _formatOutput,
    generatedExtension: '.localizationbuilder.widgetbook.json',
  );
}

/// Builder for the AppBuilder annotation.
/// Creates a .appbuilder.widgetbook.json file for each .dart file containing a
/// AppBuilder annotation
Builder appResolverBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    AppBuilderResolver(),
    generatedExtension: '.appbuilder.widgetbook.json',
    formatOutput: _formatOutput,
  );
}

/// Builder for [ScaffoldBuilderResolver]
Builder scaffoldBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    ScaffoldBuilderResolver(),
    formatOutput: _formatOutput,
    generatedExtension: '.scaffoldbuilder.widgetbook.json',
  );
}

/// Builder for [ThemeBuilderResolver]
Builder themeResolverBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    ThemeBuilderResolver(),
    formatOutput: _formatOutput,
    generatedExtension: '.themebuilder.widgetbook.json',
  );
}

/// Builder for [UseCaseBuilderResolver]
Builder useCaseBuilder(BuilderOptions options) {
  return JsonLibraryBuilder(
    UseCaseBuilderResolver(),
    formatOutput: _formatOutput,
    generatedExtension: '.usecasebuilder.widgetbook.json',
  );
}

/// Builder for the WidgetbookApp annotation.
/// Creates exactly one app.widgetbook.dart file next to the file containing
/// the WidgetbookApp annotation.
Builder widgetbookBuilder(BuilderOptions options) {
  return LibraryBuilder(
    WidgetbookGenerator(),
    generatedExtension: '.widgetbook.dart',
  );
}

/// Formats .json files generated by the builders above so that the files
/// become valid.
String _formatOutput(String input) {
  return input.replaceAll('\n]\n\n[\n', ',\n');
}
