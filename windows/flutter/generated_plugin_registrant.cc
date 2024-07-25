//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <objectbox_sync_flutter_libs/objectbox_sync_flutter_libs_plugin.h>
#include <permission_handler_windows/permission_handler_windows_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  ObjectboxSyncFlutterLibsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ObjectboxSyncFlutterLibsPlugin"));
  PermissionHandlerWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PermissionHandlerWindowsPlugin"));
}
