//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <file_saver/file_saver_plugin.h>
#include <isar_flutter_libs/isar_flutter_libs_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FileSaverPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSaverPlugin"));
  IsarFlutterLibsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("IsarFlutterLibsPlugin"));
}
